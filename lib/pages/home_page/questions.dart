import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project1/api/APIService.dart';
import 'package:project1/model/question_model.dart';
import 'package:project1/pages/home_page/choice_page.dart';
import 'package:project1/widgets/widgets.dart';
import '../../api/APIService.dart';
import '../../api/APIService.dart';
import '../../api/APIService.dart';
import '../../api/APIService.dart';
import '../../api/APIService.dart';
import '../../model/question_model.dart';
import '../../model/question_model.dart';
import '../../model/question_model.dart';
import '../submit_page.dart';
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

  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  Widget answertextfield(){
    TextEditingController textEditingController= new TextEditingController();
    return TextFormField(
      controller: textEditingController,
        decoration: InputDecoration(hintText: "Free Text"),
        validator: (val) =>
            val.length < 1 ? "Please answer the question" : null);
  }
  AsyncSnapshot snapshot;


  @override
  void initState() {
    getques();
    super.initState();
  }
  List<Widget> listttt=[];

  void getques()async{
    await APIServices().questions();
    print("this is the questions we get from api and save it in the list");
    questionsdata.forEach((element) {print(element.questionId);});
    print("this is the questions type");
    await questionsdata.forEach((element) {
      if(element.questionType==QuestionType.YES_NO){
        listttt.add(RadYN());
        print("yes/no addedd");
      }else if(element.questionType==QuestionType.POOR_FAIR_GOOD_EXCELLENT){
        listttt.add(RadPFGE());
        print("poor_good is added");
      }else if(element.questionType==QuestionType.FREE_TEXT){
        listttt.add(answertextfield());
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
                  new Flexible(
                    child: new ListView.builder(
                                itemCount: questionsdata.length??"",
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
                                              ? Center(child: CircularProgressIndicator())
                                              : listttt[index]
                                        ],
                                      )
                                    ],
                                  );
                                }

                        ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      

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


}
