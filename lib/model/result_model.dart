// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
    Category({
        this.questionId,
        this.userEmail,
        this.userName,
        this.answer,
        this.latitude,
        this.longitude,
    });

    int questionId;
    String userEmail;
    String userName;
    String answer;
    String latitude;
    String longitude;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        questionId: json["QuestionID"],
        userEmail: json["UserEmail"],
        userName: json["UserName"],
        answer: json["Answer"],
        latitude: json["Latitude"],
        longitude: json["Longitude"],
    );

    Map<String, dynamic> toJson() => {
        "QuestionID": questionId,
        "UserEmail": userEmail,
        "UserName": userName,
        "Answer": answer,
        "Latitude": latitude,
        "Longitude": longitude,
    };
}
