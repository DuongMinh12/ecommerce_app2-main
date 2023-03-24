import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/catagory_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Product extends Equatable {
  final String name;
  final String imageUrl;
  final String category;
  num price;
  final bool isRecommended;
  final bool isPopular;
  final String desciption;
  final int id;
  int quantity;

  Product({
    required this.name,
    required this.imageUrl,
    required this.category,
     this.price =0,
    required this.isRecommended,
    required this.isPopular,
    this.quantity = 0,
    required this.desciption,
    required this.id,
  });

  @override
  // TODO: implement props
  List<Object?> get props {
    return [name, imageUrl, category, price, isRecommended, isPopular, quantity, id, desciption];
  }
  // List<Object?> get props => [name, imageUrl, category, price, isRecommended, isPopular, quantity, id, desciption];

  // factory Product.fromSnapshot(DocumentSnapshot snap) {
  //   return Product(
  //     category: snap['category'], // ? snap.get('category') : '',
  //     imageUrl: snap['imageUrl'], // ? snap.get('imageUrl') : '',
  //     isPopular: snap['isPopular'], // ? snap.get('isPopular') : '',
  //     isRecommended: snap['isRecommended'], // ? snap.get('isRecommended') : '',
  //     name: snap['name'], // ? snap.get('name') : '',
  //     price: snap['price'],
  //     id: snap['id'],
  //     desciption: snap['desciption'],
  //     quantity: snap['quantity'],// ? snap.get('price') : '',
  //   );
  // return product;

  static Product fromSnapshot(DocumentSnapshot snap) {
    var product = Product(
      category: snap['category'], // ? snap.get('category') : '',
      imageUrl: snap['imageUrl'], // ? snap.get('imageUrl') : '',
      isPopular: snap['isPopular'], // ? snap.get('isPopular') : '',
      isRecommended: snap['isRecommended'], // ? snap.get('isRecommended') : '',
      name: snap['name'], // ? snap.get('name') : '',
      price: snap['price'],
      id: snap['id'],
      desciption: snap['desciption'],
      quantity: snap['quantity'], // ? snap.get('price') : '',
    );
    return product;
  }

  Product copyWith({
    int? id,
    String? name,
    String? imageUrl,
    String? category,
    String? desciption,
    bool? isRecommended,
    bool? isPopular,
    int? quantity,
    num? price,
  }) {
    return Product(
        id: id ?? this.id,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        category: category ?? this.category,
        isRecommended: isRecommended ?? this.isRecommended,
        isPopular: isPopular ?? this.isPopular,
        desciption: desciption ?? this.desciption,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity);
  }

  Map<String, dynamic> toMap(){
    return {
      'id' : id,
      'name' : name,
      'imageUrl' : imageUrl,
      'category' : category,
      'isRecommended' : isRecommended,
      'isPopular' : isPopular,
      'price' : price,
      'quantity': quantity,
    };
  }

  @override
  bool get stringify => true;

//Wolfberry Company’s Organic Goji juice can preserve the original flavour , color and nutrients in maximum in process, is the new choice of healthy food.
  static List<Product> products = [
    Product(
        id: 1,
        quantity: 10,
        desciption: 'Wolfberry Company’s Organic Goji juice can preserve the original flavour , color and nutrients in maximum in process, is the new choice of healthy food.',
        name: 'Smoothies Bery',
        imageUrl: 'https://onesweetappetite.com/wp-content/uploads/2020/02/Triple-Berry-Smoothie-Recipe-5.jpg',
        category: 'Smoothies',
        price: 35,
        isRecommended: true,
        isPopular: true),
    Product(
        id: 2,
        quantity: 10,
        desciption: 'Wolfberry Company’s Organic Goji juice can preserve the original flavour , color and nutrients in maximum in process, is the new choice of healthy food.',
        name: 'Smoothies Apple',
        imageUrl: 'https://nourishplate.com/wp-content/uploads/2021/06/Apple-Banana-Smoothie-Recipe-7.jpg',
        category: 'Smoothies',
        price: 20,
        isRecommended: false,
        isPopular: true),
    Product(
        id: 3,
        quantity: 10,
        desciption: 'Wolfberry Company’s Organic Goji juice can preserve the original flavour , color and nutrients in maximum in process, is the new choice of healthy food.',
        name: 'Bery Juice',
        imageUrl: 'https://vaya.in/recipes/wp-content/uploads/2018/05/Goji-Berry-Juice.jpg',
        category: 'Water',
        price: 30,
        isRecommended: true,
        isPopular: false),
    Product(
        id: 4,
        quantity: 10,
        desciption: 'Wolfberry Company’s Organic Goji juice can preserve the original flavour , color and nutrients in maximum in process, is the new choice of healthy food.',
        name: 'Orange Juice',
        imageUrl: 'https://static.toiimg.com/thumb/msid-68562297,width-1280,resizemode-4/68562297.jpg',
        category: 'Water',
        price: 25,
        isRecommended: false,
        isPopular: true),
    Product(
        id: 5,
        quantity: 10,
        desciption: 'Wolfberry Company’s Organic Goji juice can preserve the original flavour , color and nutrients in maximum in process, is the new choice of healthy food.',
        name: 'CocaCola',
        imageUrl: 'https://cafebiz.cafebizcdn.vn/zoom/700_438/2015/cocacola-1442439070176-crop-1442456236110.jpg',
        category: 'Soft Drink',
        price: 3,
        isRecommended: true,
        isPopular: false),
    Product(
        id: 6,
        quantity: 10,
        desciption: 'Wolfberry Company’s Organic Goji juice can preserve the original flavour , color and nutrients in maximum in process, is the new choice of healthy food.',
        name: 'Fanta',
        imageUrl: 'https://cafefcdn.com/zoom/700_438/203337114487263232/2020/9/12/photo1599881514274-15998815144371025052414.jpg',
        category: 'Soft Drink',
        price: 3,
        isRecommended: true,
        isPopular: true),
    Product(
        id: 7,
        quantity: 10,
        desciption: 'Wolfberry Company’s Organic Goji juice can preserve the original flavour , color and nutrients in maximum in process, is the new choice of healthy food.',
        name: 'Smoothies Grape',
        imageUrl: 'https://gethealthyu.com/wp-content/uploads/2021/01/ECTOMORPH-3.png',
        category: 'Smoothies',
        price: 20,
        isRecommended: true,
        isPopular: true),
    Product(
        name: 'Tea',
        id: 8,
        quantity: 10,
        desciption: 'Wolfberry Company’s Organic Goji juice can preserve the original flavour , color and nutrients in maximum in process, is the new choice of healthy food.',
        imageUrl: 'https://sainthonore.com.vn/media/product/2021/05//33072_1620976904.jpg',
        category: 'Water',
        price: 15,
        isRecommended: true,
        isPopular: false),
  ];
}
