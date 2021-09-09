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
                  "+92 300 0000000",
                ),
                accountName: Text("National Youth Service"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/nys-logo.jpeg"),
                ),
              ),
            ),
            
            ListTile(
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
