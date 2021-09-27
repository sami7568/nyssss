// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Update categoryFromJson(String str) => Update.fromJson(json.decode(str));

String categoryToJson(Update data) => json.encode(data.toJson());

class Update {
  Update({
    this.status,
    this.message,
    this.data,
  });

  var status;
  String message;
  List<DataUpdate> data;

  factory Update.fromJson(Map<String, dynamic> json) => Update(
    status: json["status"],
    message: json["message"],
    data: List<DataUpdate>.from(json["data"].map((x) => DataUpdate.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DataUpdate {
  DataUpdate({
    this.status,
    this.message,
  });

  var status;
  String message;

  factory DataUpdate.fromJson(Map<String, dynamic> json) => DataUpdate(
    status: json["status"],
    message: json["message"],

  );

  DataUpdate.toString();

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
