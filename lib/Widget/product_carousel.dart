import 'package:flutter/material.dart';

import '../models/models.dart';
import '../screens/screens.dart';
import 'Widget.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;
  const ProductCarousel({
   super.key, required this.products,
  });

  // final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                margin: EdgeInsets.only(right: 8),
                child: ProductCard(product: products[index],
                widthFactor: 2.2,));
          }),
    );
  }
}