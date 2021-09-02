// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
    Category({
        this.status,
        this.message,
        this.data,
    });

    int status;
    String message;
    List<Datum> data;

     // Get Item by ID
  Datum getById(int id) =>
      data.firstWhere((element) => element.id == id, orElse: null);

  // Get Item by Position
  Datum getByPosition(int pos) => data[pos];


    factory Category.fromJson(Map<String, dynamic> json) => Category(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.name,
        this.isActive,
        this.isDeleted,
    });

    int id;
    String name;
    bool isActive;
    bool isDeleted;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
    );

  Datum.toString();

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "isActive": isActive,
        "isDeleted": isDeleted,
    };
}
