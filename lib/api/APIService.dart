import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/model/category_model.dart';
import 'package:project1/model/login_model.dart';
import 'package:project1/model/signUp_model.dart';
import 'package:project1/pages/home_page/homepage.dart';
import 'package:project1/pages/login.dart';

class APIServices {
  String accessToken =
      "MKNoqMH8lH57Nm1HDkcefOq24pCOLO3tSDN_euSVHwkT4DUbNqBvJ0PMmBfxkW8jBXUpJGUe1rFTsYxf6dGdJIbmvAdXOgUZO0C6c5eTHiTCkGQkfGoRDZ2puENzehFk6zV43JkOb-rtJjskeRKfQHsaXYpkXkbXZuaSCcI3cIMY81BSW_VGdk_pMmnl1fZ3cqxv0GcopSj42Mm-3zvhhfJaCAFcMACFD4ytYBEXdAqXfpaSJl0fxu546YXrBbxYFlv8skwo26HV3d5GigOicUQIjUXP0v03gjchyjns6TI-Yf3kMDCY62gXKLblPhT-";
  Future<Dio> launchDio() async {
    /// TODO: Settings for cache to be done here...
    Dio dio = new Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    // dio.interceptors.add(
    //     DioCacheManager(CacheConfig(baseUrl: EndPoint.baseUrl)).interceptor);
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["accept"] = 'application/json';
    dio.options.headers["Authorization"] = 'Bearer $accessToken';

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
    final response = await dio
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
    // Map<String, dynamic> map = json.decode(response.data);
    // print(map);
    // List<dynamic> jsonData = map["data"];
    // print(jsonData);
  }

  Future<LoginRequestModel> loginUser(String email, String password) async {
    Dio dio = await launchDio();

    final response =
        await dio.get('https://nysapi.yestechsl.com/api/users/getall');
    if (response.statusCode == 200) {
      print('${response.data}');
    }
  }

  Future<List<Datum>> fetchDatum() async {
    Dio dio = await launchDio();

    final response = await dio
        .get('https://nysapi.yestechsl.com/api/questions/getcategories');
    if (response.statusCode == 200) {
      Map<String, dynamic> decodeCat =
          jsonDecode(response.data);

      final jsonData = Category.fromJson(decodeCat);
      var productList = jsonData.data as List;
      List<Datum> products = productList.map((e) => Datum.fromJson(e)).toList();

      return products;
    } else {
      return List<Datum>();
    }
  }
}
