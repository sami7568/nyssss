import 'package:flutter/material.dart';
import 'package:project1/model/category_model.dart';
import 'package:project1/pages/home_page/category.dart';
import 'package:project1/pages/login.dart';
// ignore: unused_import
import 'package:project1/pages/signup/personal_info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
