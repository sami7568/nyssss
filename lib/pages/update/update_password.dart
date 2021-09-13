import 'package:flutter/material.dart';
import 'package:project1/api/APIService.dart';
import 'package:project1/model/password_model.dart';
import 'package:project1/pages/login.dart';
import 'package:project1/widgets/widgets.dart';

class UpdatePassword extends StatefulWidget {

  @override
  _UpdatePasswordState createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
   TextEditingController emailIdTextEditingController = new TextEditingController();
    TextEditingController passwordTextEditingController = new TextEditingController();
 TextEditingController newPasswordTextEditingController = new TextEditingController();

 APIServices apiServices = new APIServices();

   GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Stack(
      
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            padding: EdgeInsets.only(top: 60, bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/nys-logo.jpeg",
                  height: 180,
                ),
                SizedBox(height: 30),
                Text(
                  "Create new Password",
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
                  child: Form(
                    key: globalFormKey,
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
                                    hintText: "old password",
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
                                  controller: newPasswordTextEditingController,
                                  // onSaved: (input) =>
                                  //     widget.datum.password = input,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    hintText: "new password",
                                    hintStyle: TextStyle(color: Colors.black54),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        
                        SizedBox(height: 30),
                        GestureDetector(
                                onTap: () async {
                                  if (globalFormKey.currentState.validate()) {
                                    var email =
                                        emailIdTextEditingController.text;
                                    var oldPassword =
                                        passwordTextEditingController.text;
                                    var newPassword =
                                        newPasswordTextEditingController.text;
                                    

                                    ChangePassword rspPersonal =
                                        await apiServices.changePassword(
                                      
                                      email,oldPassword,newPassword
                                    );
                                    print(rspPersonal);

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()));
                                  }
                                },
                            
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            color: blueColor(),
                            child: Center(
                                child: Text(
                              "Change Password",
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
                    
                  ),
                
              ],
            ),
          ),
        ),
      ],
    );
  }
}