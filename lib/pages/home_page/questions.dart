import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:project1/api/APIService.dart';
import 'package:project1/model/question_model.dart';
import 'package:project1/model/submit_model.dart';
import 'package:project1/pages/home_page/choice_page.dart';
import 'package:project1/widgets/widgets.dart';

import '../submit_page.dart';
import 'drawer.dart';

List<int> qId = [];

class Category extends StatefulWidget {
  final String email;
  final String password;
  const Category({
    Key key,
    this.email,
    this.password,
  }) : super(key: key);
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  APIServices apiServices = new APIServices();

  TextEditingController freeTextEditingController = new TextEditingController();

  List<DynamicWidget> listDynamic = [];
  List qId = [];

  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  addDynamic() {
    listDynamic.add(new DynamicWidget());
  }

  submitData() {
    listDynamic.forEach((element) {
    });
  }

  addquestionId(int id) {
    qId.add(id);
    print(id);
  }






  int val = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: Stack(
        children: [
          BackgroundImage(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/nys-logo.jpeg",
                    height: 180,
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Home",
                    style: TextStyle(
                        color: Color(0xff1330fa),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: FutureBuilder(
                        future: APIServices().categories(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            return ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(snapshot.data[index].questionText,
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      snapshot.data[index].questionType ==
                                              QuestionType.YES_NO
                                          ? Column(
                                              children: [
                                                RadYN(),
                                              ],
                                            )
                                          : Column(
                                              children: [
                                                snapshot.data[index]
                                                            .questionType ==
                                                        QuestionType
                                                            .POOR_FAIR_GOOD_EXCELLENT
                                                    ? Column(
                                                        children: [
                                                          RadPFGE(),
                                                        ],
                                                      )
                                                    : addTextFeild(),
                                              ],
                                            ),
                                    ],
                                  );
                                });
                          }
                        }),
                  ),
                  GestureDetector(
                    onTap: () async {
                      // Submit rspPersonal = await apiServices.addResult(questionId, widget.email, userName, answer, latitude, longitude)

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
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column radyn(int id) {
    addquestionId(id);
    return Column(
      children: [
        RadYN(),
      ],
    );
  }

  Column radPfge(int id) {
    addquestionId(id);
    return Column(
      children: [
        RadPFGE(),
      ],
    );
  }

  Widget addTextFeild() {
    addDynamic();

    //addquestionId(questionId);

    print("textfeild is added");
    return DynamicWidget();
  }
}

int counter = 0;

class DynamicWidget extends StatelessWidget {
  TextEditingController textEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(hintText: "Free Text"),
        validator: (val) =>
            val.length < 1 ? "Please answer the question" : null);
  }
}
