import 'package:flutter/material.dart';
import 'package:project1/api/APIService.dart';
import 'package:project1/widgets/widgets.dart';

import 'others_info.dart';

class NYSInfo extends StatefulWidget {
          
  const NYSInfo({
    Key key,

    this.fullName,
    this.age,
    this.cNumber,
    this.email,
    this.city,
    this.country,
    this.password,
  }) : super(key: key);

final String fullName;
final String email;
final String cNumber;
final String city;
final String country;
final String  age;
final String password;
  
  @override
  NYSInfoState createState() => NYSInfoState();
}

class NYSInfoState extends State<NYSInfo> {


  TextEditingController nysNumController = new TextEditingController();

  TextEditingController dateRegController = new TextEditingController();

  TextEditingController placePrimController = new TextEditingController();

  TextEditingController localGovtController = new TextEditingController();

  TextEditingController commDevController = new TextEditingController();

  TextEditingController descController = new TextEditingController();

  TextEditingController locationProjController = new TextEditingController();

  TextEditingController townController = new TextEditingController();

  TextEditingController districtController = new TextEditingController();

GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();

APIServices apiServices;

@override
void initState() { 
  print(widget.password);
  super.initState();
  
}

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
                  "(NYS info)",
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
                          controller: nysNumController,
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
                            hintText: " NYS call up number",
                            hintStyle: TextStyle(color: Colors.black54),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: dateRegController,
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
                            hintText: " Date of Registeration",
                            hintStyle: TextStyle(color: Colors.black54),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: placePrimController,
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
                            hintText: " Place of primary assignment",
                            hintStyle: TextStyle(color: Colors.black54),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: localGovtController,
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
                            hintText: " Local Government Area",
                            hintStyle: TextStyle(color: Colors.black54),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: commDevController,
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
                            hintText: " Community Development Project",
                            hintStyle: TextStyle(color: Colors.black54),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: descController,
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
                            hintText: " Description",
                            hintStyle: TextStyle(color: Colors.black54),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: locationProjController,
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
                            hintText: " Location of Project",
                            hintStyle: TextStyle(color: Colors.black54),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: townController,
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
                            hintText: " Town",
                            hintStyle: TextStyle(color: Colors.black54),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: districtController,
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
                            hintText: " District",
                            hintStyle: TextStyle(color: Colors.black54),
                          ),
                        ),
                        SizedBox(height: 40),
                        GestureDetector(
                          onTap: () {
                   if (globalFormKey.currentState.validate()) {
                                var nysCall = nysNumController.text;
                  
                                var dateReg = dateRegController.text;
                                var placePrim = placePrimController.text;
                                var localGovt = localGovtController.text;
                                var communDev = commDevController.text;
                                var district = districtController.text;
                                var locProj = locationProjController.text;
                                var town = townController.text;
                                var description = descController.text;

                              
                            
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OthersInfo(fullName: widget.fullName,
                                    cNumber: widget.cNumber,
                                    age: widget.age,
                                    city: widget.city,
                                    country: widget.country,
                                    password: widget.password,
                                    email: widget.email, nysCall: nysCall, dateReg: dateReg, placePrim: placePrim, localGovt: localGovt, communDev: communDev, district: district, locProj: locProj, town: town, description: description,)));
                          // }
                   }
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
