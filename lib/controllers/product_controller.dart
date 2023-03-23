import 'package:get/get.dart';

import '../models/models.dart';


class ProductController extends GetxController{
  var newProduct = {}.obs;

  get price => newProduct['price'];
  get quantity => newProduct['quantity'];
  get isRecommended => newProduct['isRecommended'];
  get isPopular => newProduct['isPopular'];
  get name => newProduct['name'];
  get id => newProduct['id'];
  get desciption => newProduct['desciption'];
  get category => newProduct['category'];


  List<ProductAdmin> productsAdmin = ProductAdmin.productsAdmin.obs;

  void updateProductPrice(int indext, ProductAdmin productads, double value) {
    productads.price = value;
    productsAdmin[indext] = productads;
}

  void updateProductQuantity(int indext, ProductAdmin productads, int value) {
    productads.quantity = value;
    productsAdmin[indext] = productads;
  }

}