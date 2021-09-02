// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Submit categoryFromJson(String str) => Submit.fromJson(json.decode(str));

String categoryToJson(Submit data) => json.encode(data.toJson());

class Submit {
    Submit({
        this.questionId,
        this.userEmail,
        this.fullName,
        this.answer,
        this.latitude,
        this.longitude,
    });

    int questionId;
    String userEmail;
    String fullName;
    String answer;
    String latitude;
    String longitude;

    factory Submit.fromJson(Map<String, dynamic> json) => Submit(
        questionId: json["QuestionID"],
        userEmail: json["UserEmail"],
        fullName: json["FullName"],
        answer: json["Answer"],
        latitude: json["Latitude"],
        longitude: json["Longitude"],
    );

    Map<String, dynamic> toJson() => {
        "QuestionID": questionId,
        "UserEmail": userEmail,
        "FullName": fullName,
        "Answer": answer,
        "Latitude": latitude,
        "Longitude": longitude,
    };
}
