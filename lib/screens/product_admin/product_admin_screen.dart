import 'package:ecommerce_app/constants/add_all.dart';
import 'package:ecommerce_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widget/Widget.dart';
import '../../Widget/product_card_admin.dart';
import '../../controllers/product_controller.dart';

class ProductAdminPage extends StatelessWidget {
   ProductAdminPage({Key? key}) : super(key: key);
  final ProductController productController = Get.put(ProductController());

  static const String routeName = 'productAdminPage';
  static Route route() {
    return MaterialPageRoute(builder: (_) => ProductAdminPage(),
      settings: RouteSettings(name: routeName),
    );
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('My Ecommerce'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Container(
            child: Card(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Add new product', style: txtfont18!.copyWith(color: Colors.white),),
                    IconButton(
                      onPressed: (){
                        Navigator.pushNamed(context, AddNewProductage.routeName);
                      }, icon: Icon(Icons.add_circle, color: Colors.white,),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: productController.productsAdmin.length,
                itemBuilder: (BuildContext context, int index){
                return  Obx( ()=> ProductCardAdmin(productad: productController.productsAdmin[index],
                  indext: index,),
                );
                }),
          ),
        ],
      ),
    );
  }
}
