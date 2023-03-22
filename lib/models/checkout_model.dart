import 'package:ecommerce_app/models/product_model.dart';
import 'package:equatable/equatable.dart';

class Checkout extends Equatable {
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

  const Checkout({
    required this.name,
    required this.email,
    required this.address,
    required this.city,
    required this.country,
    required this.zipcode,
    required this.products,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,

  });

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

  Map<String, Object> toDocument(){
    Map customerAddress = Map();
    customerAddress['address'] = address;
    customerAddress['city'] = city;
    customerAddress['country'] = country;
    customerAddress['zipcode'] = zipcode;
    return {
      'customerAddress' : customerAddress,
      'customerName' : name!,
      'customerEmail' : email!,
      'customerProducts' : products!.map((product) => product.name).toList(),
      'customerSubtotal' : subtotal!,
      'customerDeliveryFee' : deliveryFee!,
      'customerTotal' : total!,

    };
  }
}
