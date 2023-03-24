import 'package:ecommerce_app/repositories/services/database_service.dart';
import 'package:get/get.dart';

import '../models/models.dart';


class ProductController extends GetxController{
  final DatabaseService database = DatabaseService();

  var newProduct = {}.obs;

  get price => newProduct['price'];
  get quantity => newProduct['quantity'];
  get isRecommended => newProduct['isRecommended'];
  get isPopular => newProduct['isPopular'];
  get name => newProduct['name'];
  get id => newProduct['id'];
  get desciption => newProduct['desciption'];
  get category => newProduct['category'];


  //List <Product> productsAdmin = Product.productsAdmin.obs;

  var productsAdmin = <Product>[].obs;

  @override
  void onInit(){
    productsAdmin.bindStream(database.getProducts());
    super.onInit();
  }



  void updateProductPrice(int indext, Product productads, num value) {
    productads.price = value;
    productsAdmin[indext] = productads;
}

  void updateProductQuantity(int indext, Product productads, int value) {
    productads.quantity = value;
    productsAdmin[indext] = productads;
  }

  void saveNewProductPrice(String field, Product product, num value){
    database.updateField(product, field, value);
  }

  void saveNewProductQuantity(String field, Product product, int value){
    database.updateField(product, field, value);
  }

}