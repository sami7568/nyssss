// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

ChangePassword categoryFromJson(String str) => ChangePassword.fromJson(json.decode(str));

String categoryToJson(ChangePassword data) => json.encode(data.toJson());

class ChangePassword {
    ChangePassword({
        this.email,
        this.oldPassword,
        this.newPassword,
    });

    String email;
    String oldPassword;
    String newPassword;

    factory ChangePassword.fromJson(Map<String, dynamic> json) => ChangePassword(
        email: json["Email"],
        oldPassword: json["OldPassword"],
        newPassword: json["NewPassword"],
    );

    Map<String, dynamic> toJson() => {
        "Email": email,
        "OldPassword": oldPassword,
        "NewPassword": newPassword,
    };
}
