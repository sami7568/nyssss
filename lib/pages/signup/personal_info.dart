import 'package:flutter/material.dart';
import 'package:project1/api/APIService.dart';
import 'package:project1/model/signUp_model.dart';
import 'package:project1/widgets/widgets.dart';

import 'nys_info.dart';
// ignore: unused_import
import 'others_info.dart';

class PersonalInfo extends StatefulWidget {
  @override
  PersonalInfoState createState() => PersonalInfoState();
}

class PersonalInfoState extends State<PersonalInfo> {
  TextEditingController fullNameController = new TextEditingController();

  TextEditingController userNameController = new TextEditingController();

  TextEditingController contactNumController = new TextEditingController();

  TextEditingController emailController = new TextEditingController();

  TextEditingController cityController = new TextEditingController();

  TextEditingController countryController = new TextEditingController();

  TextEditingController ageController = new TextEditingController();

  TextEditingController passwordController = new TextEditingController();

  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            padding: EdgeInsets.only(top: 50, bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/nys-logo.jpeg",
                  height: 100,
                ),
                SizedBox(height: 20),
                Text(
                  "Sign up",
                  style: TextStyle(
                      color: blueColor(),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "(personal info)",
                  style: TextStyle(color: blueColor()),
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
                        TextFormField(
                          controller: fullNameController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey[300],
                            hintText: " Full Name",
                            hintStyle: TextStyle(color: Colors.black54),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: userNameController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey[300],
                            hintText: " User Name",
                            hintStyle: TextStyle(color: Colors.black54),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: contactNumController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey[300],
                            hintText: " Contact Number",
                            hintStyle: TextStyle(color: Colors.black54),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: emailController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey[300],
                            hintText: " Email",
                            hintStyle: TextStyle(color: Colors.black54),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: cityController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey[300],
                            hintText: " City",
                            hintStyle: TextStyle(color: Colors.black54),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: countryController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey[300],
                            hintText: " Country",
                            hintStyle: TextStyle(color: Colors.black54),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: ageController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey[300],
                            hintText: " Age",
                            hintStyle: TextStyle(color: Colors.black54),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [dob("dd"), dob("mm"), dob("Year")],
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: passwordController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey[300],
                            hintText: " Password",
                            hintStyle: TextStyle(color: Colors.black54),
                          ),
                        ),
                        SizedBox(height: 40),
                        GestureDetector(
                          onTap: () {
                            String fullName = fullNameController.text;
                            var userName = userNameController.text;
                            var email = emailController.text;
                            var contactNo = contactNumController.text;
                            var city = cityController.text;
                            var country = countryController.text;
                            var age = ageController.text;
                            var password = passwordController.text;

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NYSInfo(
                                          fullName: fullName,
                                          userName: userName,
                                          cNumber: contactNo,
                                          age: age,
                                          city: city,
                                          country: country,
                                          password: password,
                                          email: email,
                                        )));
                            // }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            color: blueColor(),
                            child: Center(
                                child: Text(
                              "Next",
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
