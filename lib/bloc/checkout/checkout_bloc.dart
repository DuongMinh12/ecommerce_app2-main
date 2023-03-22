import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/bloc/cart/cart_bloc.dart';
import 'package:ecommerce_app/repositories/checkout/base_checkout_repository.dart';
import 'package:ecommerce_app/repositories/checkout/checkout_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/models.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc _cartBloc;
  final CheckoutRepository _checkoutRepository;
  StreamSubscription? _cartSubscription;
  StreamSubscription? _checkoutSubscription;

  CheckoutBloc({ required CartBloc cartBloc, required CheckoutRepository checkoutRepository})
      : _cartBloc = cartBloc,
        _checkoutRepository = checkoutRepository,
        super(cartBloc.state is CartLoaded
            ? CheckoutLoaded(
                products: (cartBloc.state as CartLoaded).cart.products,
                subtotal: (cartBloc.state as CartLoaded).cart.subtotalSring,
                deliveryFee: (cartBloc.state as CartLoaded).cart.deliveryFreeSring,
                total: (cartBloc.state as CartLoaded).cart.totalFeeSring,
              )
            : CheckoutLoading()) {
    _cartSubscription = cartBloc.stream.listen((state) {
      if (state is CartLoaded) {
        add(UpdateCheckout(cart: state.cart));
      }
    });
  }

  @override
  Stream<CheckoutState> maEventToState(CheckoutEvent event) async* {
    if (event is UpdateCheckout) {
      yield* _mapUpdateCheckoutToState(event, state);
    }
    if (event is ConfirmCheckout) {
      yield* _mapConfirmCheckoutToState(event, state);
    }
  }

  Stream<CheckoutState> _mapUpdateCheckoutToState(UpdateCheckout event, CheckoutState state) async* {
    if (state is CheckoutLoaded) {
      yield CheckoutLoaded(
        email: event.email ?? state.email,
        name: event.name ?? state.name,
        products: event.cart?.products ?? state.products,
        deliveryFee: event.cart?.deliveryFreeSring ?? state.deliveryFee,
        subtotal: event.cart?.subtotalSring ?? state.subtotal,
        total: event.cart?.totalFeeSring ?? state.total,
        address: event.address ?? state.address,
        city: event.city ?? state.city,
        country: event.country ?? state.country,
        zipcode: event.zipcode ?? state.zipcode,
      );
    }
  }

  Stream<CheckoutState> _mapConfirmCheckoutToState(ConfirmCheckout event, CheckoutState state) async* {
    _checkoutSubscription?.cancel();
    if (state is CheckoutLoaded) {
      try {
        await _checkoutRepository.addCheckout(event.checkout);
        print('Done');
        yield CheckoutLoading();
      } catch (_) {}
    }
  }
}
