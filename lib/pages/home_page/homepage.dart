import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:project1/api/APIService.dart';
import 'package:project1/model/category_model.dart';
import 'package:project1/model/login_model.dart';
import 'package:project1/pages/home_page/drawer.dart';
import 'package:project1/widgets/widgets.dart';

class HomePage extends StatefulWidget {

  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  APIServices apiServices = new APIServices();

  List<Datum> _cat;

  loadData(){
    return apiServices.fetchDatum();
  }



  @override
  void initState() { 
    super.initState();
  
    apiServices.fetchDatum().then((cat){
      _cat = cat;
      
    });
  }
  

  @override
  Widget build(BuildContext context) {
  
  
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          drawer: MyDrawer(),
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            padding: EdgeInsets.only(top: 20, bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/nys-logo.jpeg",
                  height: 180,
                ),
                SizedBox(height: 30),
                Text(
                  "Home",
                  style: TextStyle(
                      color: blueColor(),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: null == _cat ? 0 : _cat.length,
                    itemBuilder: (context, index) {
                      Datum cat = _cat[index]; 
                      return ListTile(
                        
                        title: Text(cat.name, style: TextStyle(color: Colors.black, fontSize: 10),),
                      );
                    }),
                SizedBox(height: 40),
                Center(
                  child: Text(
                    "dataEst dolor sadipscing ut vero eirmod nonumy lorem justo no. \n Sadipscing sit eirmod est eirmod.",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


