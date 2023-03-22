import 'package:ecommerce_app/Widget/Widget.dart';
import 'package:ecommerce_app/bloc/cart/cart_bloc.dart';
import 'package:ecommerce_app/constants/add_all.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/screens/checkout/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);
  static const String routeName = 'cartPage';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => CartPage(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(
          title: "Cart",
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, CheckoutPage.routeName);
                  },
                  child: Text(
                    'GO TO CHECKOUT',
                    style: txtfont18,
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                )
              ],
            ),
          ),
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CartLoaded) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              state.cart.freeDeliverySring,
                              style: txtfont14,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Add more item',
                                style: txtfont14!.copyWith(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(primary: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), elevation: 0),
                            )
                          ],
                        ),
                        Container(
                          height: 310,
                          child: ListView.builder(
                              itemCount:  state.cart.ProductQuantity(state.cart.products).keys.length,
                              itemBuilder: (BuildContext context, int indext) {
                                return CardProductCard(
                                    quantity: state.cart.ProductQuantity(state.cart.products).values.elementAt(indext),
                                    product: state.cart.ProductQuantity(state.cart.products).keys.elementAt(indext));
                              }),
                        ),
                      ],
                    ),
                    OrderSummary(),
                  ],
                ),
              );
            } else {
              return Center(
                child: Text('Something went wrong...'),
              );
            }
          },
        )
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Column(
        //         children: [
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Text(Cart().freeDeliverySring, style: txtfont14,),
        //               ElevatedButton(onPressed: (){},
        //                 child: Text('Add more item', style: txtfont14!.copyWith(color: Colors.white),),
        //                 style: ElevatedButton.styleFrom(
        //                     primary: Colors.black,
        //                     shape: RoundedRectangleBorder(
        //                         borderRadius: BorderRadius.circular(8)
        //                     ),
        //                     elevation: 0
        //                 ),)
        //             ],
        //           ),
        //           Container(
        //             height: 310,
        //             child: ListView.builder(
        //               itemCount: Cart().products.length,
        //                 itemBuilder: (BuildContext context, int indext){
        //                   return CardProductCard(product: Cart().products[indext]);
        //                 }),
        //           ),
        //         ],
        //       ),
        //       Column(
        //         children: [
        //           Divider(thickness: 2,),
        //           Padding(
        //             padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
        //             child: Column(
        //               children: [
        //                 Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                   children: [
        //                     Text('SUBTOTAL', style: txtfont14,),
        //                     Text('\$${Cart().subtotalSring}', style: txtfont14,),
        //                   ],
        //                 ),
        //                 SizedBox(height: 10,),
        //                 Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                   children: [
        //                     Text('DELEVERY FREE', style: txtfont14,),
        //                     Text('\$${Cart().deliveryFreeSring}', style: txtfont14,),
        //                   ],
        //                 ),
        //               ],
        //             ),
        //           ),
        //           Stack(
        //             children: [
        //               Container(
        //                 width: MediaQuery.of(context).size.width,
        //                 height: 60,
        //                 decoration: BoxDecoration(
        //                     color: Colors.black.withAlpha(50)
        //                 ),
        //               ),
        //               Container(
        //                 width: MediaQuery.of(context).size.width,
        //                 margin: EdgeInsets.all(5),
        //                 height: 50,
        //                 decoration: BoxDecoration(
        //                   color: Colors.black,
        //                 ),
        //                 child: Padding(
        //                   padding: const EdgeInsets.symmetric(horizontal: 35.0),
        //                   child: Row(
        //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                     children: [
        //                       Text('TOTAL', style: txtfont14!.copyWith(color: Colors.white),),
        //                       Text('\$${Cart().totalFeeSring}', style: txtfont14!.copyWith(color: Colors.white),),
        //                     ],
        //                   ),
        //                 ),
        //               )
        //             ],
        //           ),
        //         ],
        //       )
        //     ],
        //   ),
        // ),
        );
  }
}
