import 'package:ecommerce_app/bloc/cart/cart_bloc.dart';
import 'package:ecommerce_app/screens/product/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/add_all.dart';
import '../models/models.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double leftPosision;
  final bool isWishLish;
  const ProductCard({
    Key? key,
    required this.product,
    this.widthFactor = 2.5,
    this.leftPosision = 0,
    this.isWishLish = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductPage.routeName, arguments: product);
      },
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / widthFactor,
            height: 150,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 70,
            left: leftPosision,
            child: Container(
              width: MediaQuery.of(context).size.width / widthFactor - leftPosision, //- 10,
              height: 75,
              decoration: BoxDecoration(
                color: blackAl50,
              ),
            ),
          ),
          Positioned(
            top: 75,
            left: leftPosision + 5,
            // right: 5,
            child: Container(
              width: MediaQuery.of(context).size.width / widthFactor - 10 - leftPosision,
              height: 65,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(100),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: txtfont12!.copyWith(color: Colors.white),
                          ),
                          Text(
                            '\$${product.price}',
                            style: txtfont12!.copyWith(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        if (state is CartLoading){
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is CartLoaded){
                          return Expanded(
                            child: IconButton(
                                onPressed: () {
                                  context
                                  .read<CartBloc>()
                                      .add(CartProductAdded(product));

                                  final snackBar = SnackBar(content: Text('Product added to your cart list!'));
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                },
                                icon: Icon(
                                  Icons.add_circle,
                                  color: Colors.white,
                                )),
                          );
                        }
                        else{ return Center(child: Text('Something went wrong'),);}
                      },
                    ),
                    isWishLish
                        ? Expanded(
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                )),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
