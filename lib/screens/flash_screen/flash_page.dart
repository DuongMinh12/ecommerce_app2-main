import 'dart:async';

import 'package:ecommerce_app/constants/add_all.dart';
import 'package:ecommerce_app/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class FlashPage extends StatelessWidget {
  const FlashPage({Key? key}) : super(key: key);
  static const String routeName = 'flashPage';
  static Route route(){
    return MaterialPageRoute(builder: (_)=> FlashPage(),
      settings: RouteSettings(name: routeName),
    );
  }

  // @override
  // void initState(){
  //   super.initState();
  //   Timer(Duration(seconds: 2), ()=> Navigator.of(context).pushReplacementNamed(HomeScreen.routeName));
  // }
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), ()=> Navigator.of(context).pushReplacementNamed(HomeScreen.routeName));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logo,
              Text('You have no choose', style: titletxtStyle!.copyWith(color: Colors.black),)
            ],
          )),
    );
  }
}
