import 'package:flutter/material.dart';
import 'package:project1/ProgressHUD.dart';
import 'package:project1/api/APIService.dart';
import 'package:project1/model/login_model.dart';
import 'package:project1/pages/home_page/homepage.dart';
import 'package:project1/pages/signup/personal_info.dart';
import 'package:project1/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

    

  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();

  LoginRequestModel requestModel = new LoginRequestModel();
  // LoginResponseModel responseModel = new LoginResponseModel();
  bool isApiCallProcess = false;
 APIServices apiService = new APIServices();
 TextEditingController emailIdTextEditingController = new TextEditingController();
 TextEditingController passwordTextEditingController = new TextEditingController();
String message = '';


  

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  @override
  Widget _uiSetup(BuildContext context) {
    return Stack(
      
      children: [
        BackgroundImage(),
        Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            padding: EdgeInsets.only(top: 50, bottom: 30),
            child: Form(
              key: globalFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/nys-logo.jpeg",
                    height: 180,
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Login",
                    style: TextStyle(
                        color: Color(0xff1330fa),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 48,
                                width: 50,
                                color: blueColor(),
                                child: Icon(
                                  Icons.email,
                                  color: Colors.white,
                                )),
                            Expanded(
                              child: TextFormField(
                                controller: emailIdTextEditingController,
                                // onSaved: (input) => widget.datum.emailId = input,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                  hintText: "email",
                                  hintStyle: TextStyle(color: Colors.black54),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                                height: 48,
                                width: 50,
                                color: blueColor(),
                                child: Icon(
                                  Icons.lock,
                                  color: Colors.white,
                                )),
                            Expanded(
                              child: TextFormField(
                                controller: passwordTextEditingController,
                                // onSaved: (input) =>
                                //     widget.datum.password = input,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                  hintText: "password",
                                  hintStyle: TextStyle(color: Colors.black54),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        GestureDetector(
                          onTap: () async {
                            if(globalFormKey.currentState.validate()){
                              var email = emailIdTextEditingController.text;
                              var password = passwordTextEditingController.text;
                              setState(() {
                                message = "please wait...";
                              });
                              var rsp = await apiService.loginUser(email, password);
                              print(rsp);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(email: email,password: password)));
                              
                            
                           }
                            
                          },
                            
                            // if (validateAndSave()) {
                            //   setState(() {
                            //     isApiCallProcess = true;
                            //   });

                            //   apiService.loginUser(email,password).then((value) {
                            //     setState(() {
                            //       isApiCallProcess = false;
                            //     });

                            //     if (value.email.isNotEmpty && value.password.isNotEmpty) {
                            //         final snackBar = SnackBar(
                            //             content: Text("Login Successful"));
                            //         scaffoldKey.currentState
                            //             .showSnackBar(snackBar);
                            //             Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => HomePage()));

                            //       } else {
                            //         final snackBar =
                            //             SnackBar(content: Text("Unsuccess"));
                            //         scaffoldKey.currentState
                            //             .showSnackBar(snackBar);
                            //       }
                            //   });
                            //   print(requestModel.toJson());
                            // }
                            
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            color: blueColor(),
                            child: Center(
                                child: Text(
                              "login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            )),
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          "Forgot Passwrod?",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        SizedBox(height: 80),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Or, ",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PersonalInfo()));
                              },
                              child: Text(
                                "create an account",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

 }
