import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
});

  @override
  // TODO: implement props
  List<Object?> get props => [name, imageUrl];

  // static Category fromSnapshot (DocumentSnapshot snap){
  //   Category category = Category(name: snap['name'], imageUrl: snap['imageUrl']);
  //   return category;
  // }

  static List<Category> catagories =[
    Category(name: 'Soft Drink',
        imageUrl: 'https://d1af89beukha9h.cloudfront.net/wp-content/uploads/2018/10/soft-drink-companies.jpg'),
    Category(name: 'Water', imageUrl: 'https://www.receiteria.com.br/wp-content/uploads/receitas-de-drinks.jpg'),
    Category(name: 'Smoothies', imageUrl: 'https://cdn7.kiwilimon.com/recetaimagen/31552/36129.jpg'),
  ];
}