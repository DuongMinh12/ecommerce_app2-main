import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/constants/add_all.dart';
import 'package:flutter/material.dart';
import '../../Widget/Widget.dart';
import 'package:ecommerce_app/models/models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = 'homeScreen';
  static Route route(){
    return MaterialPageRoute(builder: (_)=> HomeScreen(),
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
                child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                autoPlay: true,
              ),
              items: Category.catagories.map((category) => HeroCarousecard(category: category)).toList(),
            )),
            SelectionTitle(
              title: "RECOMMENT",
            ),
            // ProductCard(product: Product.products[0],),
            ProductCarousel( products: Product.products.where((product) => product.isRecommended).toList()),
            SelectionTitle(
              title: "MOST POPULAR",
            ),
            // ProductCard(product: Product.products[0],),
            ProductCarousel( products: Product.products.where((product) => product.isPopular).toList()),
          ],
        ),
      ),
    );
  }
}
