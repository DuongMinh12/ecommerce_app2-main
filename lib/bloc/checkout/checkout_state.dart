part of 'checkout_bloc.dart';

@immutable
abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object?> get props => [];
}

class CheckoutLoading extends CheckoutState {
  @override
  List<Object?> get props => [];
}

class CheckoutLoaded extends CheckoutState {
  final String? name;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipcode;
  final List<Product>? products;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;
  final Checkout checkout;

  CheckoutLoaded({
    this.name,
    this.email,
    this.address,
    this.city,
    this.country,
    this.zipcode,
    this.products,
    this.subtotal,
    this.deliveryFee,
    this.total,
  }) : checkout = Checkout(
      name: name,
      email: email,
      address: address,
      city: city,
      country: country,
      zipcode: zipcode,
      products: products,
      subtotal: subtotal,
      deliveryFee: deliveryFee,
      total: total);

  @override
  List<Object?> get props => [
    name,
    email,
    address,
    city,
    country,
    zipcode,
    products,
    subtotal,
    deliveryFee,
    total,
  ];
}
