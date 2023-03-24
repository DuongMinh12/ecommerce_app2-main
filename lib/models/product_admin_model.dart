// import 'dart:convert';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:equatable/equatable.dart';
//
// class ProductAdmin extends Equatable{
//   final int id;
//   final String name;
//   final String imageUrl;
//   final String category;
//   final String desciption;
//   final bool isRecommended;
//   final bool isPopular;
//   int quantity;
//   double price;
//
//   ProductAdmin({
//     required this.id,
//     required this.name,
//     required this.imageUrl,
//     required this.category,
//     this.price = 0.0,
//     required this.isRecommended,
//     required this.isPopular,
//     this.quantity = 0,
//     required this.desciption,
//   });
//
//
//
//   @override
//   List<Object> get props {return [id, name, imageUrl, category, price, isRecommended, isPopular, quantity, desciption];}
//
//   ProductAdmin copyWith({
//     int? id,
//     String? name,
//     String? imageUrl,
//     String? category,
//     String? desciption,
//     bool? isRecommended,
//     bool? isPopular,
//     int? quantity,
//     double? price,
//   }) {
//     return ProductAdmin(
//         id: id ?? this.id,
//         name: name ?? this.name,
//         imageUrl: imageUrl ?? this.imageUrl,
//         category: category ?? this.category,
//         isRecommended: isRecommended ?? this.isRecommended,
//         isPopular: isPopular ?? this.isPopular,
//         desciption: desciption ?? this.desciption,
//         price: price ?? this.price,
//         quantity: quantity ?? this.quantity);
//   }
//
//   Map<String, dynamic> toMap(){
//     return {
//       'id' : id,
//       'name' : name,
//       'imageUrl' : imageUrl,
//       'category' : category,
//       'isRecommended' : isRecommended,
//       'isPopular' : isPopular,
//       'price' : price,
//       'quantity': quantity,
//     };
//   }
//
//   factory ProductAdmin.fromSnapshot(DocumentSnapshot snap){
//     return ProductAdmin(
//         id: snap['id'],
//         name: snap['name'],
//         imageUrl: snap['imageUrl'],
//         category: snap['category'],
//         isRecommended: snap['isRecommended'],
//         isPopular: snap['isPopular'],
//         desciption: snap['desciption'],
//         quantity: snap['quantity']);
//   }
//
//   // String toJson() => json.encode(toMap());
//   // factory ProductAdmin.fromJson(String source) => ProductAdmin.fromMap(json.decode(source));
//
//   @override
//   bool get stringify => true;
//
//   static List<ProductAdmin> productsAdmin= [
//     ProductAdmin(
//         id: 1,
//         quantity: 10,
//         desciption: 'Wolfberry Company’s Organic Goji juice can preserve the original flavour , color and nutrients in maximum in process, is the new choice of healthy food.',
//         name: 'Smoothies Bery',
//         imageUrl: 'https://onesweetappetite.com/wp-content/uploads/2020/02/Triple-Berry-Smoothie-Recipe-5.jpg',
//         category: 'Smoothies',
//         price: 35.0,
//         isRecommended: true,
//         isPopular: true),
//     ProductAdmin(
//         id: 2,
//         quantity: 10,
//         desciption: 'Wolfberry Company’s Organic Goji juice can preserve the original flavour , color and nutrients in maximum in process, is the new choice of healthy food.',
//         name: 'Smoothies Apple',
//         imageUrl: 'https://nourishplate.com/wp-content/uploads/2021/06/Apple-Banana-Smoothie-Recipe-7.jpg',
//         category: 'Smoothies',
//         price: 20.0,
//         isRecommended: false,
//         isPopular: true),
//     ProductAdmin(
//         id: 3,
//         quantity: 10,
//         desciption: 'Wolfberry Company’s Organic Goji juice can preserve the original flavour , color and nutrients in maximum in process, is the new choice of healthy food.',
//         name: 'Bery Juice',
//         imageUrl: 'https://vaya.in/recipes/wp-content/uploads/2018/05/Goji-Berry-Juice.jpg',
//         category: 'Water',
//         price: 30.0,
//         isRecommended: true,
//         isPopular: false),
//     ProductAdmin(
//         id: 4,
//         quantity: 10,
//         desciption: 'Wolfberry Company’s Organic Goji juice can preserve the original flavour , color and nutrients in maximum in process, is the new choice of healthy food.',
//         name: 'Orange Juice',
//         imageUrl: 'https://static.toiimg.com/thumb/msid-68562297,width-1280,resizemode-4/68562297.jpg',
//         category: 'Water',
//         price: 25.0,
//         isRecommended: false,
//         isPopular: true),
//     ProductAdmin(
//         id: 5,
//         quantity: 10,
//         desciption: 'Wolfberry Company’s Organic Goji juice can preserve the original flavour , color and nutrients in maximum in process, is the new choice of healthy food.',
//         name: 'CocaCola',
//         imageUrl: 'https://cafebiz.cafebizcdn.vn/zoom/700_438/2015/cocacola-1442439070176-crop-1442456236110.jpg',
//         category: 'Soft Drink',
//         price: 3.0,
//         isRecommended: true,
//         isPopular: false),
//     ProductAdmin(
//         id: 6,
//         quantity: 10,
//         desciption: 'Wolfberry Company’s Organic Goji juice can preserve the original flavour , color and nutrients in maximum in process, is the new choice of healthy food.',
//         name: 'Fanta',
//         imageUrl: 'https://cafefcdn.com/zoom/700_438/203337114487263232/2020/9/12/photo1599881514274-15998815144371025052414.jpg',
//         category: 'Soft Drink',
//         price: 3.0,
//         isRecommended: true,
//         isPopular: true),
//     ProductAdmin(
//         id: 7,
//         quantity: 10,
//         desciption: 'Wolfberry Company’s Organic Goji juice can preserve the original flavour , color and nutrients in maximum in process, is the new choice of healthy food.',
//         name: 'Smoothies Grape',
//         imageUrl: 'https://gethealthyu.com/wp-content/uploads/2021/01/ECTOMORPH-3.png',
//         category: 'Smoothies',
//         price: 20.0,
//         isRecommended: true,
//         isPopular: true),
//     ProductAdmin(name: 'Tea',
//         id: 8,
//         quantity: 10,
//         desciption: 'Wolfberry Company’s Organic Goji juice can preserve the original flavour , color and nutrients in maximum in process, is the new choice of healthy food.',
//         imageUrl: 'https://sainthonore.com.vn/media/product/2021/05//33072_1620976904.jpg',
//         category: 'Water', price: 15.0, isRecommended: true, isPopular: false),
//   ];
// }