// part of 'checkout_bloc.dart';
//
// @immutable
// abstract class CheckoutEvent extends Equatable {
//  conts CheckoutEvent();
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
//   UpdateCheckout({
//     this.name,
//     this.email,
//     this.address,
//     this.city,
//     this.country,
//     this.zipcode,
//     this.cart,
//   }); /*: checkout = Checkout(
//       name: name,
//       email: email,
//       address: address,
//       city: city,
//       country: country,
//       zipcode: zipcode,
//       products: products,
//       subtotal: subtotal,
//       deliveryFee: deliveryFee,
//       total: total);*/
//
//   @override
//   List<Object?> get props => [name, email, address, city, country, zipcode, cart];
// }
//
// class ConfirmCheckout extends CheckoutEvent {
//   final Checkout checkout;
//
//    ConfirmCheckout({required this.checkout});
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
