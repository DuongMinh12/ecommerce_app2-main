// part of 'checkout_bloc.dart';
//
// @immutable
// abstract class CheckoutEvent extends Equatable {
//  const CheckoutEvent();
//
//   @override
//   List<Object?> get props => [];
// }
//
// class UpdateCheckout extends CheckoutEvent {
//   final String? name;
//   final String? email;
//   final String? address;
//   final String? city;
//   final String? country;
//   final String? zipcode;
//   final Cart? cart;
//
//   const UpdateCheckout({
//     this.name,
//     this.email,
//     this.address,
//     this.city,
//     this.country,
//     this.zipcode,
//     this.cart,
//   });
//
//   @override
//   List<Object?> get props => [name, email, address, city, country, zipcode, cart];
// }
//
// class ConfirmCheckout extends CheckoutEvent {
//   final Checkout checkout;
//
//    const ConfirmCheckout({required this.checkout});
//
//   @override
//   List<Object?> get props => [checkout];
// }
//
// // class UpdateFormCheckout extends CheckoutEvent {
// //   final List<Product>? products;
// //   final String? subtotal;
// //   final String? deliveryFee;
// //   final String? total;
// //
// //   UpdateFormCheckout({required this.products,this.deliveryFee,this.total,this.subtotal});
// //
// //   @override
// //   List<Object?> get props => [products,deliveryFee,total,subtotal];
// // }
