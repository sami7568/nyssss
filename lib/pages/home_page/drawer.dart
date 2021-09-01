import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
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
                  "+92 315 0964368",
                ),
                accountName: Text("Muhammad Sajid"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/nys-logo.jpeg"),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.person_2,
                color: Colors.grey,
              ),
              title: Text(
                "New Group",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.person,
                color: Colors.grey,
              ),
              title: Text(
                "Contacts",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.call,
                color: Colors.grey,
              ),
              title: Text(
                "Calls",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person_pin_circle_sharp,
                color: Colors.grey,
              ),
              title: Text(
                "People Nearby",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.message,
                color: Colors.grey,
              ),
              title: Text(
                "Saved Messages",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
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
