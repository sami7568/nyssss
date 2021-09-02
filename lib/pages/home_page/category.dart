import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project1/api/APIService.dart';
import 'package:project1/model/question1_model.dart';
import 'package:project1/pages/home_page/choice_page.dart';
import 'package:project1/widgets/widgets.dart';

import '../submit_page.dart';
import 'drawer.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
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
                                      ? Column(
                                          children: [
                                            RadYN(),
                                          ],
                                        )
                                      : Column(
                                          children: [
                                            snapshot.data[index].questionType ==
                                                    QuestionType
                                                        .POOR_FAIR_GOOD_EXCELLENT
                                                ? Column(
                                                    children: [
                                                      RadPFGE(),
                                                    ],
                                                  )
                                                : TextField(
                                                    decoration: InputDecoration(
                                                        hintText: "Free Text"),
                                                  )
                                          ],
                                        ),
                                ],
                              );
                            });
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
