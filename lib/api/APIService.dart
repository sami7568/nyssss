

// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:dio/dio.dart';
import 'package:project1/model/category_model.dart';
import 'package:project1/model/login_model.dart';
import 'package:project1/model/modelPass.dart';
import 'package:project1/model/password_model.dart';
import 'package:project1/model/question_model.dart';

import 'package:project1/model/signUp_model.dart';
import 'package:project1/model/submit_model.dart';
import 'package:project1/pages/home_page/category.dart';

import '../model/question_model.dart';
List<Question> questionsdata;
 int typeId = 0;

class APIServices {
  // String accessToken =
  //     "oDeWtZWM_QQcfsj5bcJotADwsojgrXpLq-fKt2te3mi6u7DOJwxF7hFVN7eNX_Pm7N9a-Z7YhaWZqnYcxtPClE05pW5AZcCWo9PM7IEyEslb1H-vHDfsNkWpXTNkdgL_G3ioF2Tq2ECoAQA39ciVueyledStIqWRe-bDb8uKUWcbofyyVtuA_gmub1EivLQ0pseMx7qvcCWG-2twgSrWU5RkHdlwy0wclRF7T_Wax23TC-Jgy4J60O10bkkiGXOwptwggX_ejjHVyh8gwpxMsj1KNJs3qwBG-nutLLkE_WaMdu9MKL67uOUdw5f2vDnI";
  Future<Dio> launchDio() async {
    
    Dio dio = new Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    // dio.interceptors.add(
    //     DioCacheManager(CacheConfig(baseUrl: EndPoint.baseUrl)).interceptor);
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["accept"] = 'application/json';
    //dio.options.headers["Authorization"] = 'Bearer $accessToken';

    dio.options.followRedirects = false;
    dio.options.validateStatus = (s) {
      if (s != null)
        return s < 500;
      else
        return false;
    };
    return dio;
  }

  // ignore: missing_return
  Future<String> registerUser(
      String fullName,
      String email,
      String contactNo,
      String city,
      String country,
      String age,
      String password,
      String town,
      String district,
      String nysCallUpNo,
      String placeofPrimaryAssignment,
      String localGovtArea,
      String communityDevelopmentProject,
    String locationOfProject,
    String dateofRegistration,
    String periodInstitutionQualification,
    String areaofSpecialization,
    String districtofOrigin,
    String employeerDuringPrimaryAssignment,
    String communityofPrimaryAssignment,
    String typeOfAssignment,
    String periodCoveredByreport) async {
    Dio dio = await launchDio();
    Response response = await dio
        .post('https://nysapi.yestechsl.com/api/users/register', data: {
      "FullName": fullName,
      "Email": email,
      "ContactNo": contactNo,
      "City": city,
      "Country": country,
      "Age": age,
      "Password": password,
      "nysCallUpNo": nysCallUpNo,
      "PlaceofPrimaryAssignment": placeofPrimaryAssignment,
      "localGovtArea": localGovtArea,
      "CommunityDevelopmentProject": communityDevelopmentProject,
       "LocationOfProject": locationOfProject,
        "DateofRegistration": dateofRegistration,
        "Period_Institution_Qualification": periodInstitutionQualification,
        "AreaofSpecialization": areaofSpecialization,
        "DistrictofOrigin": districtofOrigin,
        "EmployeerDuringPrimaryAssignment": employeerDuringPrimaryAssignment,
        "CommunityofPrimaryAssignment": communityofPrimaryAssignment,
        "TypeOfAssignment": typeOfAssignment,
        "PeriodCoveredByreport": periodCoveredByreport,
    });
    if (response.statusCode == 200) {
      print('${response.data}');
      return response.statusMessage;
    }
  }

  // ignore: missing_return
  Future<LoginData> loginUser(String email, String password) async {
    Dio dio = await launchDio();

    Response response =
        await dio.get('https://nysapi.yestechsl.com/api/users/login?email=${email}&password=${password}');
    if (response.statusCode == 200) {
      final body = response.data;
      return LoginData(message: body['message'],);
    }
  }



  // ignore: missing_return
  Future<List<LoginRequestModel>> profileData(String email) async {
    Dio _dio = await launchDio();

    Response response = await _dio
        .get('https://nysapi.yestechsl.com/api/users/profile?Email=${email}');
    if (response.statusCode == 200) {
      LoginData profile = LoginData.fromJson(response.data);
      return profile.data;
      
  }
}

  // ignore: missing_return
  Future<List<Datum>> categories() async {
    Dio _dio = await launchDio();

    Response response = await _dio
        .get('https://nysapi.yestechsl.com/api/questions/getcategories');
    if (response.statusCode == 200) {
      Category category = Category.fromJson(response.data);
      return category.data;
      
  }
}


   // ignore: missing_return
   Future<List<Submit>> addResult(
  List<dynamic> questionId,
  String userEmail,
  String userName,
  List<dynamic> answer,
  String latitude,
  String longitude,
       int questionCategory,

) async {

    Dio dio = await launchDio();
    Response response = await dio
        .post('https://nysapi.yestechsl.com/api/questions/addresults', data: {
      "UserEmail": userEmail,
      "UserName": userName,
      "Latitude": latitude,
      "Longitude": longitude,
      'QuestionCategory':questionCategory,
      "QuestionAnswersArray" :[
          for(var i =0;i<answer.length;i++){
          "QuestionId":questionId[i],
          "Answer":answer[i],
        },
      ],
    });
    if (response.statusCode == 200) {
      print('${response.data}');
      print(response.statusMessage);
      DataUpdate category = DataUpdate.fromJson(response.data);
      completedmessage = category.message;

    }
  }

// ignore: missing_return
 Future<List<Question>> questions() async {
    Dio _dio = await launchDio();
   
    Response response = await _dio
        .get('https://nysapi.yestechsl.com/api/questions/getbycategory?Category=${typeId}');
    if (response.statusCode == 200) {
      CatType categorytype = CatType.fromJson(response.data);
       questionsdata = categorytype.data;
      return categorytype.data;
      
  }
}

 // ignore: missing_return
  Future<String> changePassword(
      String email,
    String oldPassword,
    String newPassword) async {
    Dio dio = await launchDio();
    Response response = await dio
        .post('https://nysapi.yestechsl.com/api/users/changepassword', data: {
        "Email": email,
        "OldPassword": oldPassword,
        "NewPassword": newPassword,
    });
    if (response.statusCode == 200) {
      print('${response.data}');
      DataUpdate category = DataUpdate.fromJson(response.data);
      print(category.message);
      return category.message;
    }
  }


}


String completedmessage;









