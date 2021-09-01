// import 'package:project1/model/login_model.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:io';
// import 'package:shared_preferences/shared_preferences.dart';

// class APIService {
//   Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    
//     final String url = "https://nysapi.yestechsl.com:443/api/users/getall";

//     Future<String> getToken() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString('access_token');
//   }
    
//   String accessToken = await getToken();

  
//   final response = await http.post(Uri.parse(url),headers: {'Authorization': 'Bearer $accessToken'}, body: requestModel.toJson());
 
//    List data =  jsonDecode(response.body);
//    data.forEach((element) {
//       var obj = element;
//      var data = obj['data'];

//      return data;

//    });
   
//   }
// }






