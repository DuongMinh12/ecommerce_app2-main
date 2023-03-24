import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/add_all.dart';
import '../models/models.dart';
import '../screens/screens.dart';

class ProductCardAdmin extends StatelessWidget {
  final Product productad;
  final int indext;
  final ProductController productController = Get.find();
   ProductCardAdmin({
    Key? key,
    required this.productad,
     required this.indext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(productad.name, style: txtfont18,),
              Text(productad.desciption, style: txtfont10!.copyWith(fontWeight: FontWeight.normal),),
              Row(
                children: [
                  Container(
                    height: 80,
                      width: 80,
                      margin: EdgeInsets.only(top: 10, right: 8),
                      child: Image.network(productad.imageUrl, fit: BoxFit.cover,)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 45,
                              child: Text('Price:', style: txtfont16,)),
                          SizedBox(
                            width: 150,
                            // margin: EdgeInsets.only(right: 10),
                            child: Slider(value: productad.price.toDouble(), onChanged: (value){
                              productController.updateProductPrice(indext, productad, value);
                            },
                              min: 0,
                              max: 100,
                              activeColor: Colors.black,
                              inactiveColor: Colors.black.withAlpha(30),
                              divisions: 10,
                            onChangeEnd: (value){
                              productController.saveNewProductPrice('price', productad, value.toInt());
                            },),
                          ),
                          Text(
                            '\$${productad.price}', style: txtfont12,),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 45,
                              child: Text('Qty:', style: txtfont16,)),
                          SizedBox(
                            width: 150,
                            child: Slider(value: productad.quantity.toDouble(), onChanged: (value){
                              productController.updateProductQuantity(indext, productad, value.toInt());
                            },
                              min: 0,
                              max: 100,
                              activeColor: Colors.black,
                              inactiveColor: Colors.black.withAlpha(30),
                              divisions: 10,
                            onChangeEnd: (value){
                              productController.saveNewProductQuantity('quantity', productad, value.toInt());
                            },),
                          ),
                          Text(
                            '${productad.quantity}', style: txtfont12,),
                        ],
                      ),
                    ],
                  ),

                ],
              ),
            ],
          ),
      ),
      // child: Stack(
      //   children: [
      //     Container(
      //       width: MediaQuery.of(context).size.width / widthFactor,
      //       height: 150,
      //       child: Image.network(
      //         productad.imageUrl,
      //         fit: BoxFit.cover,
      //       ),
      //     ),
      //     Positioned(
      //       top: 70,
      //       left: leftPosision,
      //       child: Container(
      //         width: MediaQuery.of(context).size.width / widthFactor - leftPosision, //- 10,
      //         height: 75,
      //         decoration: BoxDecoration(
      //           color: blackAl50,
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       top: 75,
      //       left: leftPosision + 5,
      //       // right: 5,
      //       child: Container(
      //         width: MediaQuery.of(context).size.width / widthFactor - 10 - leftPosision,
      //         height: 65,
      //         decoration: BoxDecoration(
      //           color: Colors.black.withAlpha(100),
      //         ),
      //         child: Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Row(
      //             children: [
      //               Expanded(
      //                 flex: 3,
      //                 child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Text(
      //                       productad.name,
      //                       style: txtfont12!.copyWith(color: Colors.white),
      //                     ),
      //                     Text(
      //                       '\$${productad.price}',
      //                       style: txtfont12!.copyWith(color: Colors.white),
      //                     )
      //                   ],
      //                 ),
      //               ),
      //                Expanded(
      //                       child: IconButton(
      //                           onPressed: () {
      //                             final snackBar = SnackBar(content: Text('Product added to your cart list!'));
      //                             ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //                           },
      //                           icon: Icon(
      //                             Icons.add_circle,
      //                             color: Colors.white,
      //                           )),
      //                     ),
      //               isWishLish
      //                   ? Expanded(
      //                 child: IconButton(
      //                     onPressed: () {},
      //                     icon: Icon(
      //                       Icons.delete,
      //                       color: Colors.white,
      //                     )),
      //               )
      //                   : SizedBox(),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}