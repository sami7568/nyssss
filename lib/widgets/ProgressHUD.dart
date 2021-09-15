import 'package:flutter/material.dart';
import 'package:project1/widgets/widgets.dart';

class ProgressDialog extends StatelessWidget {
  String message;

  ProgressDialog({this.message});


  @override
  Widget build(BuildContext context) {
    return Dialog(
      
      backgroundColor: blueColor(),
      child: Container(
        margin: EdgeInsets.all(15.0),
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.0),
        color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(children: [
          SizedBox(width: 6.0,),
          CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black),),
          SizedBox(width: 26.0,),
          Text(message,style: TextStyle(color: Colors.black, fontSize: 15.0),)
        ],),
      ),
      ),
      
      
    );
  }





}
