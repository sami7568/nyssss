// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

LoginData categoryFromJson(String str) => LoginData.fromJson(json.decode(str));

String categoryToJson(LoginData data) => json.encode(data.toJson());

class LoginData {
    LoginData({
        this.status,
        this.message,
        this.data,
    });

    int status;
    String message;
    List<LoginRequestModel> data;

    factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        status: json["status"],
        message: json["message"],
        data: List<LoginRequestModel>.from(json["data"].map((x) => LoginRequestModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class LoginRequestModel {
    LoginRequestModel({
        this.fullName,
        this.phoneNumber,
        this.emailId,
        this.userName,
        this.country,
        this.city,
        this.age,
        this.password,
        this.future1,
        this.future2,
        this.future3,
    });

    String fullName;
    String phoneNumber;
    String emailId;
    dynamic userName;
    String country;
    String city;
    String age;
    String password;
    String future1;
    String future2;
    String future3;

    factory LoginRequestModel.fromJson(Map<String, dynamic> json) => LoginRequestModel(
        fullName: json["fullName"],
        phoneNumber: json["PhoneNumber"],
        emailId: json["emailId"],
        userName: json["userName"],
        country: json["country"],
        city: json["city"],
        age: json["age"],
        password: json["password"],
        future1: json["future1"],
        future2: json["future2"],
        future3: json["future3"],
    );

    Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "PhoneNumber": phoneNumber,
        "emailId": emailId,
        "userName": userName,
        "country": country,
        "city": city,
        "age": age,
        "password": password,
        "future1": future1,
        "future2": future2,
        "future3": future3,
    };
}
