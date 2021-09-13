import 'package:flutter/material.dart';
import 'package:project1/api/APIService.dart';
import 'package:project1/model/login_model.dart';
import 'package:project1/pages/home_page/drawer.dart';
import 'package:project1/widgets/widgets.dart';

class ProfilePage extends StatefulWidget {

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

APIServices apiServices = new APIServices();
LoginRequestModel loginRequestModel = new LoginRequestModel();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("new world")
    );
  }
}