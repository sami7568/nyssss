import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/pages/home_page/profile_page.dart';
import 'package:project1/pages/update/update_password.dart';

class MyDrawer extends StatelessWidget {
  String email;
  MyDrawer({this.email});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountEmail: Text(
                  "+92 300 0000000",
                ),
                accountName: Text("National Youth Service"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/nys-logo.jpeg"),
                ),
              ),
            ),
            
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(email: email,)));
              },
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.person,
                  color: Colors.grey,
                ),
                title: Text(
                  "Profile",
                  textScaleFactor: 1.2,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePassword()));
              },
              child: ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.grey,
                ),
                title: Text(
                  "Settings",
                  textScaleFactor: 1.2,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              leading: Icon(
                Icons.person_add,
                color: Colors.grey,
              ),
              title: Text(
                "Invite Friends",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
