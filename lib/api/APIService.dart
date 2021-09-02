
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:project1/model/category_model.dart';
import 'package:project1/model/login_model.dart';
import 'package:project1/model/question1_model.dart';

import 'package:project1/model/signUp_model.dart';
import 'package:project1/widgets/widgets.dart';

 int typeId = 0;

class APIServices {

 
  // String accessToken =
  //     "oDeWtZWM_QQcfsj5bcJotADwsojgrXpLq-fKt2te3mi6u7DOJwxF7hFVN7eNX_Pm7N9a-Z7YhaWZqnYcxtPClE05pW5AZcCWo9PM7IEyEslb1H-vHDfsNkWpXTNkdgL_G3ioF2Tq2ECoAQA39ciVueyledStIqWRe-bDb8uKUWcbofyyVtuA_gmub1EivLQ0pseMx7qvcCWG-2twgSrWU5RkHdlwy0wclRF7T_Wax23TC-Jgy4J60O10bkkiGXOwptwggX_ejjHVyh8gwpxMsj1KNJs3qwBG-nutLLkE_WaMdu9MKL67uOUdw5f2vDnI";
  Future<Dio> launchDio() async {
    /// TODO: Settings for cache to be done here...
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

  Future<SignupUser> registerPersonalUser(
      String fullName,
      String email,
      String contactNo,
      String city,
      String country,
      String age,
      String password,
      String nysCallUpNo,
      String dateofRegistration,
      String placeofPrimaryAssignment,
      String localGovtArea,
      String communityDevelopmentProject,
      String district,
      String locationOfProject,
      String town,
      String description,
      String periodInstitutionQualification,
      String institution,
      String qualification,
      String areaofSpecialization,
      String districtofOrigin,
      String employeerDuringPrimaryAssignment,
      String communityofPrimaryAssignment,
      String typeOfAssignment,
      String periodCoveredByreport,
      String period) async {
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
      "DateofRegistration": dateofRegistration,
      "PlaceofPrimaryAssignment": placeofPrimaryAssignment,
      "localGovtArea": localGovtArea,
      "CommunityDevelopmentProject": communityDevelopmentProject,
      "Description": description,
      "LocationOfProject": locationOfProject,
      "Town": town,
      "District": district,
      "Period_Institution_Qualification": periodInstitutionQualification,
      "Institution": institution,
      "Qualification": qualification,
      "AreaofSpecialization": areaofSpecialization,
      "DistrictofOrigin": districtofOrigin,
      "EmployeerDuringPrimaryAssignment": employeerDuringPrimaryAssignment,
      "CommunityofPrimaryAssignment": communityofPrimaryAssignment,
      "TypeOfAssignment": typeOfAssignment,
      "PeriodCoveredByreport": periodCoveredByreport,
      "Period": period,
    });
    if (response.statusCode == 200) {
      print('${response.data}');
    }
    
  }

  Future<LoginRequestModel> loginUser(String email, String password) async {
    Dio dio = await launchDio();

    Response response =
        await dio.get('https://nysapi.yestechsl.com/api/users/getall');
    if (response.statusCode == 200) {
      print('${response.data}');
    }
  }

//  List<Datum> datum = [];
  Future<List<Datum>> fetchDatum() async {
    Dio _dio = await launchDio();

    Response response = await _dio
        .get('https://nysapi.yestechsl.com/api/questions/getcategories');
    if (response.statusCode == 200) {
      Category category = Category.fromJson(response.data);
      return category.data;
      
  }
}
  

   

Future<List<Question>> monthCommSer() async {
    Dio _dio = await launchDio();
   
    Response response = await _dio
        .get('https://nysapi.yestechsl.com:443/api/questions/getbycategory?Category=${typeId}');
    if (response.statusCode == 200) {
      CatType categorytype = CatType.fromJson(response.data);
      return categorytype.data;
      
  }
}

// Future<EnumValues<QuestionType>> questType() async {
//     Dio _dio = await launchDio();
   
//     Response response = await _dio
//         .get('https://nysapi.yestechsl.com:443/api/questions/getbyquestiontype?QuestionType=${typeId}');
//     if (response.statusCode == 200) {
      
//       Question quesType = Question.fromJson(response.data);
//       return 
      
//   }
// }
}