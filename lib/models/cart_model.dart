import 'package:equatable/equatable.dart';
import 'package:ecommerce_app/models/models.dart';

class Cart extends Equatable{
  final List<Product> products;
  const Cart({this.products = const <Product>[]});

  // @override
  // List<Object?> get props => [products];

  Map ProductQuantity (products){
    var quantity = Map();
    products.forEach((products){
      if (!quantity.containsKey(products)){
        quantity[products]=1;
      }
      else{quantity[products] +=1;
      }
    });

    return quantity;
  }

  double get subtotal => products.fold(0, (total, current) => total + current.price);

  double deliveryFree (subtotal) {
    if (subtotal >= 50){
      return 0.0;
    } else return 10.0;
  }

  double totalFee (subtotal, deliveryFree) {
    return subtotal + deliveryFree (subtotal);
  }

  String freeDelivery (subtotal){
    if (subtotal >= 50){
      return 'You have Free Delivery';
    }
    else{
      double mising = 50.0 - subtotal;
      return 'Add \$${mising.toStringAsFixed(2)} for Free Delivery';
    }
  }


  String get subtotalSring => subtotal.toStringAsFixed(2);

  String get deliveryFreeSring => deliveryFree(subtotal).toStringAsFixed(2);

  String get freeDeliverySring => freeDelivery(subtotal);

  String get totalFeeSring => totalFee(subtotal, deliveryFree).toStringAsFixed(2);

  // double coin ( subtotal){
  //   if(subtotal < 50){
  //     subtotal = 50 - subtotal;
  //     return subtotal;
  //   } else return 0;
  // }
  //
  // String get coinNeed => coin(subtotal).toStringAsFixed(2);

  @override
  List<Object?> get props => [products];

}