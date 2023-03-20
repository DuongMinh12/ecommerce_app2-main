import 'package:ecommerce_app/models/models.dart';
import 'screens/screens.dart';
import 'package:flutter/material.dart';


  // final Map<String, WidgetBuilder> routes = {
  //   FlashPage.routeName: (context) => FlashPage(),
  //   HomeScreen.routeName: (context) => HomeScreen(),
  //   CartPage.routeName:(context) => CartPage(),
  //   CatalogPage.routeName: (context) => CatalogPage(),
  //   ProductPage.routeName: (context) => ProductPage(),
  //   WishListPage.routeName: (context) => WishListPage(),
  // };

  class Approute{
    static Route onGenerrateRoute(RouteSettings settings){
      print('This is route: ${settings.name}');
       switch(settings.name){
         case HomeScreen.routeName:
           return HomeScreen.route();
         case ProductPage.routeName:
           return ProductPage.route(product: settings.arguments as Product);
         case CatalogPage.routeName:
           return CatalogPage.route(category: settings.arguments as Category);
         case FlashPage.routeName:
           return FlashPage.route();
         case CartPage.routeName:
           return CartPage.route();
         case WishListPage.routeName:
           return WishListPage.route();
         default:
           return _errorRoute();
       }
    }

    static Route _errorRoute(){
      return MaterialPageRoute(builder: (_)=> Scaffold(appBar: AppBar(title: Text('Error'),),),
        settings: RouteSettings(name: 'error'),
      );
    }
  }




