import 'package:flutter/material.dart';
import 'package:project1/api/APIService.dart';
import 'package:project1/model/login_model.dart';
import 'package:project1/pages/home_page/drawer.dart';
import 'package:project1/widgets/widgets.dart';

class ProfilePage extends StatefulWidget {
  String email;
  ProfilePage({this.email});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  APIServices apiServices = new APIServices();
  LoginRequestModel loginRequestModel = new LoginRequestModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "User Profile",
                    style: TextStyle(
                        color: Color(0xff1330fa),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    flex: 2,
                    child: FutureBuilder(
                        future: APIServices().profileData(widget.email),
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
                                        height: 20,
                                      ),
                                      Center(
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 70,
                                              width: 350,
                                              child: Card(
                                                color: Colors.grey[100],
                                                child: Center(
                                                  child: Text(
                                                      "Name : ${snapshot.data[index].fullName}"),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 70,
                                              width: 350,
                                              child: Card(
                                                color: Colors.grey[100],
                                                child: Center(
                                                  child: Text(
                                                      "Phone No. : ${snapshot.data[index].phoneNumber}"),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 70,
                                              width: 350,
                                              child: Card(
                                                color: Colors.grey[100],
                                                child: Center(
                                                  child: Text(
                                                      "Email ID : ${snapshot.data[index].emailId}"),
                                                ),
                                              ),
                                            ),
                                            // Container(
                                            //   height: 70,
                                            //   width: 350,
                                            //   child: Card(
                                            //     color: Colors.grey[100],
                                            //     child: Center(
                                            //       child: Text(
                                            //           "User Name : ${snapshot.data[index].userName}"),
                                            //     ),
                                            //   ),
                                            // ),
                                            Container(
                                              height: 70,
                                              width: 350,
                                              child: Card(
                                                color: Colors.grey[100],
                                                child: Center(
                                                  child: Text(
                                                      "Country : ${snapshot.data[index].country}"),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 70,
                                              width: 350,
                                              child: Card(
                                                color: Colors.grey[100],
                                                child: Center(
                                                  child: Text(
                                                      "City : ${snapshot.data[index].city}"),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 70,
                                              width: 350,
                                              child: Card(
                                                color: Colors.grey[100],
                                                child: Center(
                                                  child: Text(
                                                      "Age : ${snapshot.data[index].age}"),
                                                ),
                                              ),
                                            ),
                                            // Container(
                                            //   height: 70,
                                            //   width: 350,
                                            //   child: Card(
                                            //     color: Colors.grey[100],
                                            //     child: Center(
                                            //       child: Text(
                                            //           "Password : ${snapshot.data[index].password}"),
                                            //     ),
                                            //   ),
                                            // ),
                                            // Container(
                                            //   height: 160,
                                            //   width: 350,
                                            //   child: Card(
                                            //     color: Colors.grey[100],
                                            //     child: Center(
                                            //       child: Padding(
                                            //         padding: const EdgeInsets.symmetric(horizontal:15.0),
                                            //         child: Text(
                                            //             "Future1 : ${snapshot.data[index].future1}"),
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),
                                            // Container(
                                            //   height: 90,
                                            //   width: 350,
                                            //   child: Card(
                                            //     color: Colors.grey[100],
                                            //     child: Center(
                                            //       child: Padding(
                                            //         padding: const EdgeInsets.symmetric(horizontal:15.0),
                                            //         child: Text(
                                            //             "Future2 : ${snapshot.data[index].future2}"),
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),
                                            // Container(
                                            //   height: 90,
                                            //   width: 350,
                                            //   child: Card(
                                            //     color: Colors.grey[100],
                                            //     child: Center(
                                            //       child: Padding(
                                            //         padding: const EdgeInsets.symmetric(horizontal:15.0),
                                            //         child: Text(
                                            //             "Future3 : ${snapshot.data[index].future3}"),
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          }
                        }),
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
