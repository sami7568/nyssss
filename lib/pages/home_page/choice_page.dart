import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/pages/home_page/questions.dart';

class RadPFGE extends StatefulWidget {
  const RadPFGE({
    Key key,
  }) : super(key: key);
  @override
  _RadPFGEState createState() => _RadPFGEState();
}

class _RadPFGEState extends State<RadPFGE> {
  int val = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            title: Text("Poor"),
            leading: Radio(
              value: 1,
              groupValue: val,
              onChanged: (value) {
                setState(() {
                  val = value;
                  //
                });
                
              },
              activeColor: Colors.black,
            ),
          ),
          ListTile(
            title: Text("Fair"),
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
            title: Text("Good"),
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
            title: Text("Excellent"),
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

class RadYN extends StatefulWidget {

  @override
  _RadYNState createState() => _RadYNState();
}

class _RadYNState extends State<RadYN> {
  int val = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            title: Text("Yes"),
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
            title: Text("No"),
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
        ],
      ),
    );
  }

}
