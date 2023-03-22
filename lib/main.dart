import 'package:ecommerce_app/bloc/cart/cart_bloc.dart';
import 'package:ecommerce_app/bloc/category/category_bloc.dart';
import 'package:ecommerce_app/bloc/checkout/checkout_bloc.dart';
import 'package:ecommerce_app/bloc/product/product_bloc.dart';
import 'package:ecommerce_app/repositories/category/category_repository.dart';
import 'package:ecommerce_app/repositories/checkout/checkout_repository.dart';
import 'package:ecommerce_app/repositories/product/product_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/wish_list/wishlist_bloc.dart';
import 'screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      /*MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=> WishlistBloc()..add(StarWishList())),
        BlocProvider<CartBloc>(create: (_)=> CartBloc()..add(CartStareted())),
        BlocProvider(create: (_) => CategoryBloc(categoruRepository: CategoryRepository(),)..add(LoadCategory())),
        BlocProvider(create: (_) => ProductBloc(productRepository: ProductRepository())..add(LoadProduct())),
        BlocProvider(create: (_) => CheckoutBloc(cartBloc: context.read<CartBloc>(),  checkoutRepository: CheckoutRepository())),//cartBloc: context.read<CartBloc>(),
      ],
      child:*/
      MyApp()

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
          BlocProvider(create: (_) => WishlistBloc()..add(StarWishList())),
          BlocProvider<CartBloc>(create: (_) => CartBloc()..add(CartStareted())),
          BlocProvider(create: (_) => CheckoutBloc(
              // cartBloc: CartBloc()..add(CartStareted())
              cartBloc: context.read<CartBloc>(), checkoutRepository: CheckoutRepository())),
          BlocProvider(
              create: (_) => CategoryBloc(
                    categoruRepository: CategoryRepository(),
                  )..add(LoadCategory())),
          BlocProvider(create: (_) => ProductBloc(productRepository: ProductRepository())..add(LoadProduct())),
           //cartBloc: context.read<CartBloc>(),
        ],
        child: MaterialApp(
          title: 'Zero To Unicorn',
          theme: ThemeData(primarySwatch: Colors.blue),
          onGenerateRoute: Approute.onGenerrateRoute,
          initialRoute: FlashPage.routeName,
          debugShowCheckedModeBanner: false,
        ));
  }
}
