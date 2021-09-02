import 'dart:convert';

LoginRequestModel loginUserFromJson(String str) => LoginRequestModel.fromJson(json.decode(str));

String loginUserToJson(LoginRequestModel data) => json.encode(data.toJson());

class LoginRequestModel {
    LoginRequestModel({
        this.email,
        this.password,
        this.fullName
    });

    String email;
    String fullName;
    String password;

    factory LoginRequestModel.fromJson(Map<String, dynamic> json) => LoginRequestModel(
        email: json["Email"],
        password: json["Password"],
        fullName: json["FullName"]
    );

    Map<String, dynamic> toJson() => {
        "Email": email,
        "Password": password,
        "FullName":fullName
    };
}


