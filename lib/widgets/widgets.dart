import 'package:flutter/material.dart';


Row iconedTextField(String hintText, Icon icon) {
  return Row(
    children: [
      Container(height: 48, width: 50, color: blueColor(), child: icon),
      Expanded(
        child: TextField(
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.black54),
          ),
        ),
      ),
    ],
  );
}

TextFormField simpleTextField(String hintText) {
  return TextFormField(
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
      border: InputBorder.none,
      filled: true,
      fillColor: Colors.grey[300],
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.black54),
    ),
  );
}

Container dob(String text) {
  return Container(
    width: 80,
    height: 40,
    color: blueColor(),
    child: Center(
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}



Color blueColor() {
  return Color(0xff1330fa);
}

class BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.jpeg"),
            fit: BoxFit.cover,
          ),
        ));
  }
}

Padding quesText(String text) {
  return Padding(
    padding: const EdgeInsets.only(left: 35),
    child: Row(
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}


