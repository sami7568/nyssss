import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project1/api/APIService.dart';
import 'package:project1/model/modelPass.dart';
import 'package:project1/model/password_model.dart';
import 'package:project1/pages/login.dart';
import 'package:project1/widgets/ProgressHUD.dart';
import 'package:project1/widgets/drawer.dart';
import 'package:project1/widgets/widgets.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
class UpdatePassword extends StatefulWidget {
  final String email;
  UpdatePassword({this.email});
  @override
  _UpdatePasswordState createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
   TextEditingController emailIdTextEditingController = new TextEditingController();
    TextEditingController passwordTextEditingController = new TextEditingController();
 TextEditingController newPasswordTextEditingController = new TextEditingController();

 APIServices apiServices = new APIServices();

   GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
   final scaffoldKey = GlobalKey<ScaffoldState>();

String emaill;
   @override
  void initState() {
     emaill= widget.email;
     emailIdTextEditingController.text = widget.email;
     super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(

  backgroundColor: Colors.white,
  elevation: 0,
  iconTheme: IconThemeData(color: Colors.black),
),

      key: scaffoldKey,
      body: Stack(
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

                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100]
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:
                                    Center(child: Text(emaill.toString(),style: TextStyle(),)),
                                  ),
                                )
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
                                    obscureText: true,
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
                                    obscureText: true,
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

                                    if(passwordTextEditingController.text.isEmpty || newPasswordTextEditingController.text.isEmpty){
                                      final snackBar = SnackBar(
                                          content: Text("Email or password is empty"));
                                      scaffoldKey.currentState
                                      // ignore: deprecated_member_use
                                          .showSnackBar(snackBar);
                                    }else{
                                      showDialog(
                                          builder: (BuildContext context) {
                                            return ProgressDialog(message: "Updating Password, Wait",);
                                          },
                                          barrierDismissible: false,
                                          context: context);
                                    if (globalFormKey.currentState.validate()) {
                                      var email =
                                          emaill;
                                      var oldPassword =
                                          passwordTextEditingController.text;
                                      var newPassword =
                                          newPasswordTextEditingController.text;

                                      String res =
                                          await apiServices.changePassword(
                                        email,oldPassword,newPassword
                                      );



                                      Fluttertoast.showToast(
                                          msg: res,
                                          toastLength: Toast.LENGTH_LONG,
                                          gravity: ToastGravity.CENTER,
                                          backgroundColor: Colors.green,
                                          textColor: Colors.white,
                                          fontSize: 16.0
                                      );
                                      Navigator.pop(context);

                                       // Navigator.push(
                                       //    context,
                                       //    MaterialPageRoute(
                                       //        builder: (context) => LoginPage()));
                                    }
                                  }},

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
      ),
    );
  }
}