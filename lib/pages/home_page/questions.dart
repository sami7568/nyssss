import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project1/api/APIService.dart';
import 'package:project1/model/question_model.dart';
import 'package:project1/pages/home_page/choice_page.dart';
import 'package:project1/widgets/widgets.dart';
import '../../api/APIService.dart';
import '../../model/question_model.dart';
import 'choice_page.dart';
import 'drawer.dart';

var ques;

class Questions extends StatefulWidget {
  final String email;
  final String password;
  const Questions({
    Key key,
    this.email,
    this.password,
  }) : super(key: key);
  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  APIServices apiServices = new APIServices();

  Map<int, String> answerMap = new Map();

  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  List<Widget> listttt=[];
  List answerDataList= [];
  List finalAnswer =[];

  List<Answertextfield> textlist =[];
  List<Answertextfield> answerlist = [];

  List<RadPFGE> pfgelist = [];
  List<RadPFGE> poorlist =[];

  List<RadYN> ynlist =[];
  List<RadYN> yeslist =[];

  AsyncSnapshot snapshot;
  @override
  void initState() {
    getques();
    super.initState();
  }
  int index =-1;
  List textFeildindexlist =[];
  List radioIndexList =[];
  List poorIndexList =[];
  List questionIdtext = [];
  List questionIdYesno = [];
  List questionIsPoor = [];
  List finalQuestionId = [];
  Future getques()async{
    await APIServices().questions();
    print("this is the questions we get from api and save it in the list");
    questionsdata.forEach((element) {print(element.questionId);});
    print("this is the questions type");
    await questionsdata.forEach((element) {
      if(element.questionType==QuestionType.YES_NO){
        setState(() {
          index = index+1;
        });
        radioIndexList.add(index);
        listttt.add(new RadYN());
        ynlist.add(new RadYN());
        questionIdYesno.add(element.questionId);
        print("yes/no addedd");
      }
      else if(element.questionType==QuestionType.POOR_FAIR_GOOD_EXCELLENT){
        setState(() {
          index = index+1;
        });
        poorIndexList.add(index);
        listttt.add(new RadPFGE());
        pfgelist.add(new RadPFGE());
        questionIsPoor.add(element.questionId);
        print("poor_good is added");
      }
      else if(element.questionType==QuestionType.FREE_TEXT){
        setState(() {
          index = index+1;
        });
        textFeildindexlist.add(index);
        print(index);
        listttt.add(new Answertextfield());
        setState(() {
          textlist.add(new Answertextfield());
        });
        questionIdtext.add(element.questionId);
        print("free text added");
      }
      print(element.questionType);});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: MyDrawer(),
      key: _scaffoldkey,
      body: listttt.length==0
          ? Center(child: CircularProgressIndicator())
          : Stack(
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
                  new Flexible(
                    child: new ListView.builder(
                                itemCount: questionsdata.length??questionsdata.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(questionsdata[index].questionText,
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Column(
                                        children: [
                                          listttt.isEmpty
                                              ? Center(
                                                child: CircularProgressIndicator())
                                              : listttt[index]
                                        ],
                                      ),
                                    ],
                                  );
                                }
                        ),
                  ),
                  GestureDetector(
                    onTap: () async {

                      print("these are textfeild indexes ");
                      //assigning textfield list
                      textFeildindexlist.forEach((element) {
                        answerlist.add(listttt[element]);
                      });

                      //adding answer of textfeild
                      answerlist.forEach((element) {
                        answerDataList.add(element.textEditingControllercontroller.text);
                      });

                      //assigning radio feild
                      radioIndexList.forEach((element) {
                        ynlist.add(listttt[element]);
                      });
                      //adding answer of yes no

                      ynlist.forEach((element) {
                        int vale=element.val;
                        if(vale==1){
                          answerDataList.add("yes");
                        }
                        else if(vale==2) {
                          answerDataList.add("no");
                        }
                      });

                      //assigning poor list
                      poorIndexList.forEach((element) {
                        poorlist.add(listttt[element]);
                      });
                      //adding poor answers to list
                      poorlist.forEach((element) {
                        if(element.val==1){
                          answerDataList.add("poor");
                        }
                        else if(element.val==2) {
                          answerDataList.add("fair");
                        }
                        else if(element.val==3){
                          answerDataList.add("good");
                        }
                        else if(element.val==4){
                          answerDataList.add("excellent");
                        }
                      });

                      answerDataList.forEach((element) {
                        finalAnswer.add(element);
                      });

                      questionIdtext.forEach((element) {
                        finalQuestionId.add(element);
                      });
                      questionIdYesno.forEach((element) {
                        //print(element);
                        finalQuestionId.add(element);
                      });
                      questionIsPoor.forEach((element) {
                        finalQuestionId.add(element);
                      });
                      print("data of answers ");

                      finalAnswer.forEach((element) {
                       // print(element);
                      });
                      print("question ids ");
                      finalQuestionId.forEach((element) {
                        //print(element);
                      });

                   /*   for(var i =0; i< finalQuestionId.length ;i ++){
                        answerMap[finalQuestionId[i]] = finalAnswer[i];
                      }
*/

                      //finalQuestionId list is questionid list
                      //finalAnswer list is answer list
/*
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SubmitPage()));*/
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
}
