import 'package:ecommerce_app/models/catagory_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Product extends Equatable{
  final String name;
  final String imageUrl;
  final String category;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product ({
    required this.name,
    required this.imageUrl,
    required this.category,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
});

  @override
  // TODO: implement props
  List<Object?> get props => [name, imageUrl, price, category, isRecommended, isPopular];

  static List<Product> products = const [
     Product(name: 'Smoothies Bery',
        imageUrl: 'https://onesweetappetite.com/wp-content/uploads/2020/02/Triple-Berry-Smoothie-Recipe-5.jpg',
        category: 'Smoothies',
        price: 35,
        isRecommended: true,
        isPopular: true),
    Product(name: 'Smoothies Apple',
        imageUrl: 'https://nourishplate.com/wp-content/uploads/2021/06/Apple-Banana-Smoothie-Recipe-7.jpg',
        category: 'Smoothies',
        price: 20,
        isRecommended: false,
        isPopular: true),
    Product(name: 'Bery Juice',
        imageUrl: 'https://vaya.in/recipes/wp-content/uploads/2018/05/Goji-Berry-Juice.jpg',
        category: 'Water',
        price: 30,
        isRecommended: true,
        isPopular: false),
    Product(name: 'Orange Juice',
        imageUrl: 'https://static.toiimg.com/thumb/msid-68562297,width-1280,resizemode-4/68562297.jpg',
        category: 'Water',
        price: 25,
        isRecommended: false,
        isPopular: true),
    Product(name: 'CocaCola',
        imageUrl: 'https://cafebiz.cafebizcdn.vn/zoom/700_438/2015/cocacola-1442439070176-crop-1442456236110.jpg',
        category: 'Soft Drink',
        price: 3,
        isRecommended: true,
        isPopular: false),
    Product(name: 'Fanta',
        imageUrl: 'https://cafefcdn.com/zoom/700_438/203337114487263232/2020/9/12/photo1599881514274-15998815144371025052414.jpg',
        category: 'Soft Drink',
        price: 3,
        isRecommended: true,
        isPopular: true),
    Product(name: 'Smoothies Grape',
        imageUrl: 'https://gethealthyu.com/wp-content/uploads/2021/01/ECTOMORPH-3.png',
        category: 'Smoothies',
        price: 20,
        isRecommended: true,
        isPopular: true),
    Product(name: 'Tea',
        imageUrl: 'https://sainthonore.com.vn/media/product/2021/05//33072_1620976904.jpg',
        category: 'Water',
        price: 15,
        isRecommended: true,
        isPopular: false),





  ];
}