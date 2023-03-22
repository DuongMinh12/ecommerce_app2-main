import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/constants/add_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Widget/Widget.dart';
import 'package:ecommerce_app/models/models.dart';

import '../../bloc/category/category_bloc.dart';
import '../../bloc/product/product_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = 'homeScreen';

  static Route route() {
    return MaterialPageRoute(builder: (_) => HomeScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Zero To Unicorn'),
      bottomNavigationBar: CustomBottomAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                child: BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryLoading) {
                      return Center(child: CircularProgressIndicator(),);
                    }
                    if (state is CategoryLoaded) {
                       return CarouselSlider(
                        options: CarouselOptions(
                          aspectRatio: 1.5,
                          viewportFraction: 0.9,
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          autoPlay: true,
                        ),
                        items: state.categories.map((category) => HeroCarousecard(category: category)).toList(),

                         //Category.catagories.map((category) => HeroCarousecard(category: category)).toList(),
                      );
                    }
                    else {
                      return Center(child: Text("Something went wrong"),);
                    }
                  },
                ),
            ),
            // CarouselSlider(
            //   options: CarouselOptions(
            //     aspectRatio: 1.5,
            //     viewportFraction: 0.9,
            //     enlargeCenterPage: true,
            //     enlargeStrategy: CenterPageEnlargeStrategy.height,
            //     autoPlay: true,
            //   ),
            //   items: Category.catagories.map((category) => HeroCarousecard(category: category)).toList(),
            // ),
            SelectionTitle(
              title: "RECOMMENT",
            ),
            //ProductCard(product: Product.products[0],),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(child: CircularProgressIndicator(),);
                }
                if (state is ProductLoaded) {
                  return ProductCarousel(products:state.products.where((product) => product.isRecommended).toList());
                }
                else {
                  return Center(child: Text('Something went wrong'),);
                }
              },
            ),
            //ProductCarousel(products:Product.products.where((product) => product.isRecommended).toList()),
            SelectionTitle(
              title: "MOST POPULAR",
            ),
            //ProductCard(product: Product.products[0],),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(child: CircularProgressIndicator(),);
                }
                if (state is ProductLoaded){
                  return ProductCarousel(products: state.products.where((product) => product.isPopular).toList());
                }
                else {
                  return Center(child: Text('Something went wrong'),);
                }
              },
            ),

            //ProductCarousel(products: Product.products.where((product) => product.isPopular).toList()),
          ],
        ),
      ),
    );
  }
}
