// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

CatType categoryFromJson(String str) => CatType.fromJson(json.decode(str));

String categoryToJson(CatType data) => json.encode(data.toJson());

class CatType {
    CatType({
        this.status,
        this.message,
        this.data,
    });

    int status;
    String message;
    List<Question> data;

    factory CatType.fromJson(Map<String, dynamic> json) => CatType(
        status: json["status"],
        message: json["message"],
        data: List<Question>.from(json["data"].map((x) => Question.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Question {
    Question({
        this.questionId,
        this.questionCatTypeId,
        this.questionTypeId,
        this.questionText,
        this.questionCatType,
        this.questionType,
        this.status,
    });

    int questionId;
    int questionCatTypeId;
    int questionTypeId;
    String questionText;
    QuestionCatType questionCatType;
    QuestionType questionType;
    String status;

    factory Question.fromJson(Map<String, dynamic> json) => Question(
        questionId: json["QuestionID"],
        questionCatTypeId: json["QuestionCatTypeID"],
        questionTypeId: json["QuestionTypeID"],
        questionText: json["QuestionText"],
        questionCatType: questionCatTypeValues.map[json["QuestionCatType"]],
        questionType: questionTypeValues.map[json["QuestionType"]],
        status: json["Status"],
    );

    Map<String, dynamic> toJson() => {
        "QuestionID": questionId,
        "QuestionCatTypeID": questionCatTypeId,
        "QuestionTypeID": questionTypeId,
        "QuestionText": questionText,
        "QuestionCatType": questionCatTypeValues.reverse[questionCatType],
        "QuestionType": questionTypeValues.reverse[questionType],
        "Status": status,
    };
}

enum QuestionCatType { QUARTERLY_PRIMARY_ASSIGNMENT, QUARTERLY_COMMUNITY_SERVICE }

final questionCatTypeValues = EnumValues({
    "Quarterly Community Service": QuestionCatType.QUARTERLY_COMMUNITY_SERVICE,
    "Quarterly Primary Assignment": QuestionCatType.QUARTERLY_PRIMARY_ASSIGNMENT
});

enum QuestionType { YES_NO, POOR_FAIR_GOOD_EXCELLENT, FREE_TEXT }

final questionTypeValues = EnumValues({
    "Free Text": QuestionType.FREE_TEXT,
    "Poor, Fair, Good, Excellent": QuestionType.POOR_FAIR_GOOD_EXCELLENT,
    "Yes/No": QuestionType.YES_NO
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
