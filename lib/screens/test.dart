import 'package:ecommerce_app/constants/add_all.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';
class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  static const String routeName = 'Tesstpage';

  static Route route() {
    return MaterialPageRoute(builder: (_) => TestPage(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(onPressed: (){
        },
        child: Text('vbhjbbj'),),
      ),
    );
  }
}
