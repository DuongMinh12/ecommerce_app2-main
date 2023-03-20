import 'package:ecommerce_app/screens/screens.dart';
import 'package:flutter/material.dart';
import '../constants/add_fontstyle.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final String title;
   AppBarWidget({
    Key? key, required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Center(
        child: Container(
          color: Colors.black,
          // alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(title,
              style: titletxtStyle),
        ),
      ),

      /// wanna change something, example: style: titletxtStyle!.copyWith()
      iconTheme: IconThemeData(color: Colors.black),
      actions: [
        IconButton(onPressed: (){
          Navigator.pushNamed(context, WishListPage.routeName);
        },
            icon: Icon(Icons.favorite))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50);
}