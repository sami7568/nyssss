import 'package:flutter/material.dart';
import 'package:project1/widgets/ProgressHUD.dart';
import 'package:project1/api/APIService.dart';
import 'package:project1/model/login_model.dart';
import 'package:project1/pages/home_page/category.dart';
import 'package:project1/pages/signup/personal_info.dart';
import 'package:project1/widgets/widgets.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

    

  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();

  LoginRequestModel requestModel = new LoginRequestModel();
  // LoginData loginData = new LoginData();
  bool isApiCallProcess = false;
 APIServices apiService = new APIServices();
 TextEditingController emailIdTextEditingController = new TextEditingController();
 TextEditingController passwordTextEditingController = new TextEditingController();
String message = '';

// void handleClick(String value) {
//     switch (value) {
//       case 'Change Password':
//       Navigator.of(context).push(MaterialPageRoute(builder: (context) => UpdatePassword()));
//         break;
//       case 'Settings':
//         break;
//     }
// }
  

  @override

  Widget build(BuildContext context) {
    return Stack(
      
      children: [
        BackgroundImage(),
        Scaffold(
        //   appBar: AppBar(
            
        //     actions: <Widget>[
              
              
        //   PopupMenuButton<String>(
            
        //     onSelected: handleClick,
        //     itemBuilder: (BuildContext context) {
        //       return {'Change Password', 'Settings'}.map((String choice) {
        //         return PopupMenuItem<String>(
        //           value: choice,
        //           child: Text(choice),
        //         );
        //       }).toList();
        //     },
        //   ),
        // ],
        //   backgroundColor: Colors.white,foregroundColor: Colors.black, elevation: 0,),
          key: scaffoldKey,
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            padding: EdgeInsets.only(top: 60, bottom: 30),
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
                                validator: (val) {
                                return RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(val)
                                    ? null
                                    : "Please enter correct email";
                              },
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
                                obscureText: true,
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
                            showDialog(
                                   builder: (BuildContext context) { 
                                     return ProgressDialog(message: "Authenticating, Please Wait",);
                                    }, 
                                    barrierDismissible: false,
                                    context: context);
                                    


                            if(globalFormKey.currentState.validate()){
                              var email = emailIdTextEditingController.text;
                              var password = passwordTextEditingController.text;
                              
                              setState(() {
                                message = "please wait...";
                              });
                              LoginData rsp = await apiService.loginUser(email, password);
                               
Navigator.pop(context);
                              

                                if (rsp.message == "Succeed") {
                                    final snackBar = SnackBar(
                                        content: Text("Login Successful"));
                                    scaffoldKey.currentState
                                        // ignore: deprecated_member_use
                                        .showSnackBar(snackBar);
                                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage(email: email,password: password)));
                                   

                                  } else {
                                    final snackBar =
                                        SnackBar(content: Text("Unsuccess"));
                                    scaffoldKey.currentState
                                        // ignore: deprecated_member_use
                                        .showSnackBar(snackBar);
                                        // Navigator.pop(context);
                                        
                                  }
                              // });
                              print(requestModel.toJson());
                            }
                            
                            },
                            
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


 }
