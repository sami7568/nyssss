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

    factory Submit.fromJson(Map<String, dynamic> json) => Submit(
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


class ListSubmit {
    List<Submit> resultData;

    ListSubmit({this.resultData});

    factory ListSubmit.fromJson(Map<String, dynamic> json) => ListSubmit(

        resultData: List<Submit>.from(json["data"].map((x) => Submit.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {

        "resultData": List<dynamic>.from(resultData.map((x) => x.toJson())),
    };
}