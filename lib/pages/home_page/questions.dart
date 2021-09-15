import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project1/api/APIService.dart';
import 'package:project1/model/question_model.dart';
import 'package:project1/pages/home_page/choice_page.dart';
import 'package:project1/widgets/widgets.dart';
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
    return TextFormField(
        
        decoration: InputDecoration(hintText: "Free Text"),
        validator: (val) =>
            val.length < 1 ? "Please answer the question" : null);
  }

  AsyncSnapshot snapshot;


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
                  Expanded(
                    child: FutureBuilder(
                        future: APIServices().questions(),
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
                                       ques =  snapshot.data[index].questionType ==
                                              1
                                          ? Column(
                                              children: [
                                                RadYN(
                                                  
                                                ),
                                              ],
                                            )
                                          : Column(
                                              children: [
                                                ques = snapshot.data[index]
                                                            .questionType ==
                                                        QuestionType
                                                            .POOR_FAIR_GOOD_EXCELLENT
                                                            
                                                    ? Column(
                                                        children: [
                                                          RadPFGE(),
                                                        ],
                                                      )
                                                    : ques = answertextfield(),
                                                  
                                                 
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
