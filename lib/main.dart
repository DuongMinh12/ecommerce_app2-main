import 'package:ecommerce_app/bloc/cart/cart_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/wish_list/wishlist_bloc.dart';
import 'screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/routes.dart';

void main() {
  runApp(MyApp()
    //     const MaterialApp(
    //   initialRoute: HomeScreen.routeName,
    //       onGenerateRoute: Approute.onGenerrateRoute,
    //       debugShowCheckedModeBanner: false,
    // )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=> WishlistBloc()..add(StarWishList())),
        BlocProvider(create: (_)=> CartBloc()..add(CartStareted()))
      ],
      child: MaterialApp(
        title: 'Zero To Unicorn',
        theme: ThemeData(
            primarySwatch: Colors.blue
        ),
        onGenerateRoute: Approute.onGenerrateRoute,
        initialRoute: FlashPage.routeName,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
