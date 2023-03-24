import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/repositories/services/database_service.dart';
import 'package:ecommerce_app/repositories/services/storage_service.dart';
import 'package:ecommerce_app/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/add_all.dart';

class AddNewProductage extends StatelessWidget {
  AddNewProductage({Key? key}) : super(key: key);

  final ProductController productController = Get.put(ProductController());
  StorageService storage = StorageService();
  DatabaseService database = DatabaseService();

  static const String routeName = 'addNewProductage';
  static Route route() {
    return MaterialPageRoute(builder: (_) => AddNewProductage(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Add new product', style: titletxtStyle,),
      ),
      body: Obx(
        ()=> Column(
          children: [
            Container(
              child: Card(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Add new image', style: txtfont18!.copyWith(color: Colors.white),),
                      IconButton(
                        onPressed: () async {
                          ImagePicker _imagePicker = ImagePicker();
                          final XFile? _image = await _imagePicker.pickImage(source: ImageSource.gallery);
                          if(_image == null){
                            ScaffoldMessenger.of(context).showSnackBar((const SnackBar(content: Text(('No Image was selected')),)),);
                            // var imageset = 'https://askanswerswiki.com/wp-content/uploads/2022/01/uong-coca-co-beo-khong-1.jpg';
                            // productController.newProduct.update('imageUrl', (_) => imageset, ifAbsent: ()=> imageset);
                            // print(productController.newProduct['imageUrl']);
                          }
                          if(_image != null){
                            await storage.uploadImage(_image);
                            var imageUrl = await storage.getDownloadUrl(_image.name);

                            productController.newProduct.update('imageUrl', (_) => imageUrl, ifAbsent: ()=> imageUrl);
                            print(productController.newProduct['imageUrl']);
                          }
                        }, icon: Icon(Icons.add_circle, color: Colors.white,),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Product Information', style: txtfont18,),
                  _buildTextFormField('Product ID',
                  'id',
                  productController),
                  _buildTextFormField('Product Name',
                      'name',
                      productController),
                  _buildTextFormField('Product Description',
                      'desciption',
                      productController),
                  _buildTextFormField('Product Category',
                      'category',
                      productController),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      _buildSlider('Price',
                      'price',
                      productController,
                      productController.price),
                      Text('\$${productController.price}'),
                    ],
                  ),
                  Row(
                    children: [
                      _buildSlider('Quantity',
                          'quantity',
                          productController,
                          productController.quantity),
                      Text('${productController.quantity}'),
                    ],
                  ),
                  _buildCheckBox('Recommended',
                  'isRecommended',
                  productController,
                  productController.isRecommended),
                  _buildCheckBox('Popular',
                  'isPopular',
                  productController,
                  productController.isPopular),
                  Center(
                    child: ElevatedButton(
                      onPressed: (){
                        database.addProduct(Product(
                            id: int.parse(productController.newProduct['id']),
                            name: productController.newProduct['name'],
                            imageUrl: productController.newProduct['imageUrl'],
                            category: productController.newProduct['category'],
                            isRecommended: productController.newProduct['isRecommended'],
                            isPopular: productController.newProduct['isPopular'],
                            desciption: productController.newProduct['desciption'],
                            price: productController.newProduct['price'],
                            quantity: productController.newProduct['quantity'].toInt(),
                        ));
                        print(productController.newProduct);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      child: Text('Save'),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Center(
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      child: Text('Click Back'),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildCheckBox(String title,
      String name,
      ProductController productController,
      bool? controllerValue) {
    return Row(
                children: [
                  SizedBox(
                      child: Text(title, style: txtfont16,),
                    width: 125,
                  ),
                  Checkbox(value: (controllerValue==null)? false : controllerValue,
                      activeColor: Colors.black.withAlpha(30),
                      checkColor: Colors.black,
                      onChanged: (value){
                    productController.newProduct.update(name, (_) => value, ifAbsent: ()=>value);
                      }),
                ],
              );
  }

  Row _buildSlider(String title,
      String name,
      ProductController productController,
      double? controllerValue) {
    return Row(
                children: [
                  SizedBox(
                    width: 75,
                      child: Text(title, style: txtfont16,)),
                  Container(
                    width: 220,
                    child: Slider(value: (controllerValue == null) ? 0: controllerValue,
                      onChanged: (value){
                      productController.newProduct.update(name, (_) => value,
                      ifAbsent: ()=>value);
                      //productController.updateProductPrice(indext, productad, value);
                    },
                      min: 0,
                      max: 100,
                      activeColor: Colors.black,
                      inactiveColor: Colors.black.withAlpha(30),
                      divisions: 10,),
                  ),
                ],
              );
  }


  TextFormField _buildTextFormField(String hintext,
      String name,
      ProductController productController){
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintext,
      ),
      onChanged: (value){
        productController.newProduct.update(name, (_) => value, ifAbsent: ()=> value);
      },
    );
  }

}