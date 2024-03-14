import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Constants/api.dart';

class UserClient {
  var client = http.Client();

  UserClient();


Future<bool?> register(phone) async {
    var url = Uri.parse(baseUrl + login);

    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'phone': phone,
      }),
    );

    if (response.statusCode == 201) {
     
      return true;
    } else {
      return false;
    }
  }

//  Future<dynamic> VerifyCode(pin) async {
//     var url = Uri.parse(baseUrl + verifycode);

//     var response = await http.post(
//       url,
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, String>{
//         'code': pin,
//       }),
//     );

//     if (response.statusCode == 201) {
 
//       return response.body;
//     } else {
//       return Responses.empty;
//     }
//  }


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
