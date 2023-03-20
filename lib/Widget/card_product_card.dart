import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart/cart_bloc.dart';
import '../constants/add_all.dart';
import '../models/models.dart';

class CardProductCard extends StatelessWidget {
  final Product product;
  final int quantity;

  const CardProductCard({Key? key, required this.product, required this.quantity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Image.network(product.imageUrl, width: 100, height: 80, fit: BoxFit.cover,),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name, style: txtfont14,),
                Text('\$${product.price}', style: txtfont14,)
              ],
            ),
          ),
          SizedBox(width: 10,),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Row(
                children: [
                  IconButton(onPressed: () {
                    context.read<CartBloc>()
                        .add(CartProductRemove(product));
                  }, icon: Icon(Icons.remove_circle)),
                  Text('$quantity', style: txtfont14,),
                  IconButton(onPressed: () {
                    context.read<CartBloc>()
                        .add(CartProductAdded(product));
                  }, icon: Icon(Icons.add_circle)),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}