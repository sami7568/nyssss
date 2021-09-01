import 'package:flutter/material.dart';
import 'package:project1/pages/home_page/choice_page.dart';
import 'package:project1/widgets/widgets.dart';

import '../submit_page.dart';
import 'drawer.dart';

class Category2 extends StatefulWidget {
  @override
  _Category2State createState() => _Category2State();
}

class _Category2State extends State<Category2> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          drawer: MyDrawer(),
          appBar: AppBar(
            elevation: 0,
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
                  "Category 2",
                  style: TextStyle(
                      color: blueColor(),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      quesText("Q1 : Question one"),
                      SizedBox(
                        height: 20,
                      ),
                      RadChoice(),
                      SizedBox(
                        height: 30,
                      ),
                      quesText("Q2 : Question two"),
                      SizedBox(
                        height: 20,
                      ),
                      RadChoice(),
                      SizedBox(
                        height: 30,
                      ),
                      quesText("Q3 : Question three"),
                      SizedBox(
                        height: 20,
                      ),
                      RadChoice(),
                      SizedBox(
                        height: 30,
                      ),
                      quesText("Q4 : Question four"),
                      SizedBox(
                        height: 20,
                      ),
                      RadChoice(),
                      SizedBox(
                        height: 30,
                      ),
                      quesText("Q5 : Question five"),
                      SizedBox(
                        height: 20,
                      ),
                      RadChoice(),
                      SizedBox(height: 50),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SubmitPage()));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          color: blueColor(),
                          child: Center(
                              child: Text(
                            "Submit",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
                        ),
                      ),
                    ],
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
