import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Constants/api.dart';

class UserClient {
  var client = http.Client();

  UserClient();

  Future<dynamic> Register(name, email, password, package_id) async {
   
    var url = Uri.parse(baseUrl + register);

    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'name': name,
        'email': email,
        'password': password,
        'package_id': package_id
      }),
    );
  
    if (response.statusCode == 200) { 
      return response.body;
    } else {
      return '';
    }
  }

  Future<dynamic> Login(email, password) async {
    var url = Uri.parse(baseUrl + login);

    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
  }

  Future<dynamic> setCodeVerfiy(email) async {
    var url = Uri.parse(baseUrl + setcodeverfiy);

    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
      }),
    );

    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  //   Future<dynamic>getUser(user_id) async {
  //   var response = await client.get(Uri.parse(baseUrl + userById + "/$user_id"));

  //   if (response.statusCode == 200) {
  //     return response.body;
  //   } else {
  //     return Responses.empty;
  //   }
  // }

//  Future<dynamic> UpdateProfile(name, phone , address , id) async {
//     var url = Uri.parse(baseUrl + updateProfile + "/$id");

//     var response = await http.post(
//       url,
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, String>{
//         'name': name,
//         'phone': phone,
//          'address': address,
//       }),
//     );

//     if (response.statusCode == 201) {

//       return response.body;
//     } else {
//       return null;
//     }
//   }
}
