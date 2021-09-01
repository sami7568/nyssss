import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadChoice extends StatefulWidget {
  @override
  _RadChoiceState createState() => _RadChoiceState();
}

class _RadChoiceState extends State<RadChoice> {
  int val = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            title: Text("Choice 1"),
            leading: Radio(
              value: 1,
              groupValue: val,
              onChanged: (value) {
                setState(() {
                  val = value;
                });
              },
              activeColor: Colors.black,
            ),
          ),
          ListTile(
            title: Text("Choice 2"),
            leading: Radio(
              value: 2,
              groupValue: val,
              onChanged: (value) {
                setState(() {
                  val = value;
                });
              },
              activeColor: Colors.black,
            ),
          ),
          ListTile(
            title: Text("Choice 3"),
            leading: Radio(
              value: 3,
              groupValue: val,
              onChanged: (value) {
                setState(() {
                  val = value;
                });
              },
              activeColor: Colors.black,
            ),
          ),
          ListTile(
            title: Text("Choice 4"),
            leading: Radio(
              value: 4,
              groupValue: val,
              onChanged: (value) {
                setState(() {
                  val = value;
                });
              },
              activeColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
