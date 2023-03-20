
import 'package:ecommerce_app/Widget/Widget.dart';
import 'package:ecommerce_app/models/catagory_model.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({ required this.category, super.key});

  static const String routeName ='catalogPage';

  static Route route({required Category category}){
    return MaterialPageRoute(builder: (_)=> CatalogPage(category: category,),
      settings: RouteSettings(name: routeName),
    );
  }

  final Category category;


  @override
  Widget build(BuildContext context) {
    final List<Product> CategoryProducts = Product.products.where((product) => product.category == category.name).toList();
    //Find how to call Category class
    return Scaffold(
      appBar: AppBarWidget(title: category.name),
      bottomNavigationBar: CustomBottomAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio:1.15 ),
            itemCount: CategoryProducts.length,
            itemBuilder: (BuildContext context, int indext){
              return Center(
                child: ProductCard(product: CategoryProducts[indext],
                widthFactor: 2.2,));
            }),
      )
      //ProductCard(product: Product.products[0]),
    );
  }
}
