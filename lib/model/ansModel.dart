
class AnswerModel{
  String userEmail;
  String userName;
  double latitude;
  double longitude;
  int questionCategory;
  List<QuestionAnswersArray> questionAnswersArray;

  AnswerModel({this.userEmail,this.questionCategory,this.latitude,this.longitude,this.userName,this.questionAnswersArray});
  Map<String, dynamic> toJson() => {
      "UserEmail": userEmail,
      "UserName": userName,
      "Latitude": latitude,
      "Longitude": longitude,
      "QuestionCategory": questionCategory,
      "QuestionAnswersArray": List<dynamic>.from(questionAnswersArray.map((x) => x.toJson())),
  };
}

class QuestionAnswersArray{
  int questionID;
  String answer;
  QuestionAnswersArray({this.questionID,this.answer});

  Map<String, dynamic> toJson() => {
    "QuesetionId": questionID,
    "answer":answer,
  };
}