
import 'package:ecommerce_app/constants/add_all.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/screens/screens.dart';
import 'package:flutter/material.dart';

import '../../Widget/Widget.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  static const String routeName = 'orderPage';
  static Route route() {
    return MaterialPageRoute(builder: (_) => OrderPage(),
      settings: RouteSettings(name: routeName),
    );
  }

  // final Product products = Product();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
          color: Colors.black,
          // alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text('Order Cart',
              style: titletxtStyle),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, HomeScreen.routeName);
          },
              icon: Icon(Icons.home))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 3,
                itemBuilder: (BuildContext context, int index){
                return const OrderCart();
                }),
          )
        ],
      ),
    );
  }
}
