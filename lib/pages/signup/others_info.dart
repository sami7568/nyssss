import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project1/api/APIService.dart';
import 'package:project1/model/signUp_model.dart';
import 'package:project1/pages/login.dart';
import 'package:project1/pages/signup/personal_info.dart';
import 'package:project1/widgets/widgets.dart';

class OthersInfo extends StatefulWidget {
  const OthersInfo({
    Key key,
    this.fullName,
    this.age,
    this.cNumber,
    this.email,
    this.city,
    this.country,
    this.password,
    this.nysCall,
    this.dateReg,
    this.placePrim,
    this.locProj,
    this.communDev,
    this.district,
    this.localGovt,
    this.town,
    this.description,
  }) : super(key: key);

  final String fullName;
  final String email;
  final String cNumber;
  final String city;
  final String country;
  final String age;
  final String password;
  final String nysCall;
  final String dateReg;
  final String placePrim;
  final String localGovt;
  final String communDev;
  final String district;
  final String locProj;
  final String town;
  final String description;

  @override
  _OthersInfoState createState() => _OthersInfoState();
}

class _OthersInfoState extends State<OthersInfo> {
  TextEditingController periodInstQualController = new TextEditingController();

  TextEditingController areaSpecController = new TextEditingController();

  TextEditingController districtOrigController = new TextEditingController();

  TextEditingController empPrimAssignController = new TextEditingController();

  TextEditingController commPrimAssignController = new TextEditingController();

  TextEditingController typeAssignController = new TextEditingController();

  TextEditingController periaodCovReportController =
      new TextEditingController();

  TextEditingController periodController = new TextEditingController();

  TextEditingController institutionController = new TextEditingController();

  TextEditingController qualificationController = new TextEditingController();

  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();

  APIServices apiServices = new APIServices();

  PersonalInfo personalInfo;

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
                  "(other info)",
                  style: TextStyle(color: blueColor()),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    children: [
                      Text(
                        "Higher Institution attended with dates",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
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
                          controller: periodInstQualController,
                          validator: (value){
                            if (value.isEmpty){
                              return "The field should not be empty";
                            }
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey[300],
                            hintText: " Period Institution Qualification",
                            hintStyle: TextStyle(color: Colors.black54),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: areaSpecController,
                          validator: (value){
                            if (value.isEmpty){
                              return "The field should not be empty";
                            }
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey[300],
                            hintText: " Area of Specialization",
                            hintStyle: TextStyle(color: Colors.black54),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: districtOrigController,
                          validator: (value){
                            if (value.isEmpty){
                              return "The field should not be empty";
                            }
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey[300],
                            hintText: " District of Origin",
                            hintStyle: TextStyle(color: Colors.black54),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: empPrimAssignController,
                          validator: (value){
                            if (value.isEmpty){
                              return "The field should not be empty";
                            }
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey[300],
                            hintText: " Employeer During Primary Assignment",
                            hintStyle: TextStyle(color: Colors.black54),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: commPrimAssignController,
                          validator: (value){
                            if (value.isEmpty){
                              return "The field should not be empty";
                            }
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey[300],
                            hintText: " Community of Primary Assignment",
                            hintStyle: TextStyle(color: Colors.black54),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: typeAssignController,
                          validator: (value){
                            if (value.isEmpty){
                              return "The field should not be empty";
                            }
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey[300],
                            hintText: " Type Of Assignment",
                            hintStyle: TextStyle(color: Colors.black54),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: periaodCovReportController,
                          validator: (value){
                            if (value.isEmpty){
                              return "The field should not be empty";
                            }
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey[300],
                            hintText: " Period Covered By report",
                            hintStyle: TextStyle(color: Colors.black54),
                          ),
                        ),
                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                if (globalFormKey.currentState.validate()) {
                                  var periodInstitutionQualification =
                                      periodInstQualController.text;
                                  var areaofSpecialization =
                                      areaSpecController.text;
                                  var districtofOrigin =
                                      districtOrigController.text;
                                  var employeerDuringPrimaryAssignment =
                                      empPrimAssignController.text;
                                  var communityofPrimaryAssignment =
                                      commPrimAssignController.text;
                                  var typeOfAssignment = typeAssignController.text;
                                  var periodCoveredByreport =
                                      periaodCovReportController.text;

                                  SignupUser rspPersonal =
                                      await apiServices.registerUser(
                                    widget.fullName,
                                    widget.email,
                                    widget.cNumber,
                                    widget.city,
                                    widget.country,
                                    widget.age,
                                    widget.password,
                                    widget.town,
                                    widget.district,
                                    widget.nysCall,
                                    widget.placePrim,
                                    widget.localGovt,
                                    widget.communDev,
                                    widget.locProj,
                                    widget.dateReg,
                                    periodInstitutionQualification,
                                    areaofSpecialization,
                                    districtofOrigin,
                                    employeerDuringPrimaryAssignment,
                                    communityofPrimaryAssignment,
                                    typeOfAssignment,
                                    periodCoveredByreport,
                                  );
                                  print(rspPersonal);

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()));
                                }
                              },
                              child: Container(
                                width: 100,
                                height: 50,
                                color: blueColor(),
                                child: Center(
                                    child: Text(
                                  "SignUp",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )),
                              ),
                            ),
                            
                          ],
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
