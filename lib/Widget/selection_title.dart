import 'package:flutter/material.dart';

import '../constants/add_all.dart';
class SelectionTitle extends StatelessWidget {
  final String title;
  const SelectionTitle({
    Key? key, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Text(title, style: txtfont18,)
    );
  }
}