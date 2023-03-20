import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/models/cart_model.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading());

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is CartStareted) {
      yield* _mapCartStaretdToState();
    } else if (event is CartProductAdded) {
      yield* _mapCartAddedToState(event, state);
    } else if (event is CartProductRemove) {
      yield* _mapCartRemoveToState(event, state);
    }
  }

  Stream<CartState> _mapCartStaretdToState() async* {
    yield CartLoading();
    try {
      await Future<void>.delayed(Duration(seconds: 1));
      yield CartLoaded();
    } catch (_) {}
  }

  Stream<CartState> _mapCartAddedToState(CartProductAdded event, CartState state) async* {
    if (state is CartLoaded) {
      try {
        yield CartLoaded(cart: Cart(
          products: List.from(state.cart.products)..add(event.product)
        ) );//pro: List.from(state.cart.products)..add(event.product));
      } catch (_) {}
    }
  }

  Stream<CartState> _mapCartRemoveToState(CartProductRemove event, CartState state) async* {
    if (state is CartLoaded) {
      try {
        yield CartLoaded(cart: Cart(
            products: List.from(state.cart.products)..remove(event.product)
        ) );//pro: List.from(state.cart.products)..add(event.product));
      } catch (_) {}
    }
  }
}
