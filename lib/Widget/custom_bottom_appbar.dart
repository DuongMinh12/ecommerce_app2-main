import 'package:ecommerce_app/screens/cart/cart_screen.dart';
import 'package:flutter/material.dart';

class CustomBottomAppbar extends StatelessWidget {
  const CustomBottomAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: (){
              Navigator.pushNamed(context, '/');
            },
              icon: Icon(Icons.home), color: Colors.white,),
            IconButton(onPressed: (){
              Navigator.pushNamed(context, CartPage.routeName);
            },
              icon: Icon(Icons.shopping_cart), color: Colors.white,),
            IconButton(onPressed: (){
              Navigator.pushNamed(context, '/');
            },
              icon: Icon(Icons.person), color: Colors.white,)
          ],
        ),
      ),
    );
  }
}