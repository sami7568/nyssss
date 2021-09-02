import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:project1/api/APIService.dart';
import 'package:project1/model/question1_model.dart';
import 'package:project1/model/submit_model.dart';
import 'package:project1/pages/home_page/choice_page.dart';
import 'package:project1/widgets/widgets.dart';

import '../submit_page.dart';
import 'drawer.dart';

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
  
  addDynamic() {
    listDynamic.add(new DynamicWidget(onchange: (){
      print("textfeild is added ");
    },));
  }

  submitData() {
    listDynamic.forEach((element) {print(element.textEditingController.text); });
  }

  List<int> qId = [];
  addquestionId(int id){
    qId.add(id);
    print(id);
  }


  int val = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Discover",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                "find",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: FutureBuilder(
                    future: APIServices().monthCommSer(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Text(snapshot.data[index].questionText,
                                      style: TextStyle(fontSize: 15)),

                                      
                                      
                                    
                                  snapshot.data[index].questionType ==
                                          QuestionType.YES_NO
                                      ? radyn(snapshot.data[index].questionId)
                                        
                                      : Column(
                                          children: [
                                            snapshot.data[index].questionType ==
                                                    QuestionType
                                                        .POOR_FAIR_GOOD_EXCELLENT
                                                ? radPfge(snapshot.data[index].questionId)
                                                : addTextFeild(snapshot.data[index].questionId),
                                          ],
                                        ),
                                ],
                              );
                            });
                      }
                    }),
              ),
              GestureDetector(
                onTap: () {
                  
                },
                child: Container(
                  child: Text("Submit"),
                  decoration: BoxDecoration(color: Colors.grey),
                ),
              )
            ],
          ),
        ),
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
  Widget addTextFeild(int questionId){
    addDynamic();
     addquestionId(questionId);
                                 
    print("textfeild is added");
    return DynamicWidget(onchange: (){print("list is created");},);
    
  }
}


class DynamicWidget extends StatelessWidget {
  TextEditingController textEditingController = new TextEditingController();

  final Function onchange;

  DynamicWidget({this.onchange});

  @override
  Widget build(BuildContext context) {
    
    return TextField(
      onChanged: onchange(),
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: "Free Text"
      ),
    );
  }
}
