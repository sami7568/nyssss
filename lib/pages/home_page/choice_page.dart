import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadPFGE extends StatefulWidget {
 int val=0;
  @override
  _RadPFGEState createState() => _RadPFGEState();
}

class _RadPFGEState extends State<RadPFGE> {
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
              groupValue: widget.val,
              onChanged: (value) {
                setState(() {
                  widget.val = value;
                });
              },
              activeColor: Colors.black,
            ),
          ),
          ListTile(
            title: Text("Fair"),
            leading: Radio(
              value: 2,
              groupValue: widget.val,
              onChanged: (value) {
                setState(() {
                  widget.val = value;
                });
              },
              activeColor: Colors.black,
            ),
          ),
          ListTile(
            title: Text("Good"),
            leading: Radio(
              value: 3,
              groupValue: widget.val,
              onChanged: (value) {
                setState(() {
                  widget.val = value;
                });
              },
              activeColor: Colors.black,
            ),
          ),
          ListTile(
            title: Text("Excellent"),
            leading: Radio(
              value: 4,
              groupValue: widget.val,
              onChanged: (value) {
                setState(() {
                  widget.val = value;
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
  int val=0;
  @override
  _RadYNState createState() => _RadYNState();
}

class _RadYNState extends State<RadYN> {
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
              groupValue: widget.val,
              onChanged: (value) {
                setState(() {
                  widget.val = value;
                  print(widget.val);
                });

              },
              activeColor: Colors.black,
            ),
          ),
          ListTile(
            title: Text("No"),
            leading: Radio(
              value: 2,
              groupValue: widget.val,
              onChanged: (value) {
                setState(() {
                  widget.val = value;
                  print(widget.val);

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



class Answertextfield extends StatefulWidget {
  String data;
  TextEditingController textEditingControllercontroller = new TextEditingController();

  @override
  _AnswertextfieldState createState() => _AnswertextfieldState();
}

class _AnswertextfieldState extends State<Answertextfield> {
  @override
  Widget build(BuildContext context) {
     return TextFormField(
         onChanged: (v){
           setState(() {
             widget.data= v;
           });
           //print(widget.data);
         },
         onFieldSubmitted: (text){
           print(text);
           print("text is submitted ");
         },
          controller: widget.textEditingControllercontroller,
          decoration: InputDecoration(hintText: "Free Text")
     );
    }
/*
  void setTextdata(String data){
    this.data = data;
  }*/
}

