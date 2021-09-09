


class LoginRequestModel {
    LoginRequestModel({
        this.emailId,
        this.password,
    });

    String emailId;
    String password;

    factory LoginRequestModel.fromJson(Map<String, dynamic> json) => LoginRequestModel(
        emailId: json["emailId"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "emailId": emailId,
        "password": password,

    };
}
