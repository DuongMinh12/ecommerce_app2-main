import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart/cart_bloc.dart';
import '../constants/add_all.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
  builder: (context, state) {
    if (state is CartLoaded) {
      return Column(
        children: [
          Divider(
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'SUBTOTAL',
                      style: txtfont14,
                    ),
                    Text(
                      '\$${state.cart.subtotalSring}',
                      style: txtfont14,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'DELEVERY FEE',
                      style: txtfont14,
                    ),
                    Text(
                      '\$${state.cart.deliveryFreeSring}',
                      style: txtfont14,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 60,
                decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
              ),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                margin: EdgeInsets.all(5),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'TOTAL',
                        style: txtfont14!.copyWith(color: Colors.white),
                      ),
                      Text(
                        '\$${state.cart.totalFeeSring}',
                        style: txtfont14!.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      );
    }
    else{ return Center(child: Text('Something went wrong'),);}
  },
);
  }
}