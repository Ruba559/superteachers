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

  Future<dynamic> UpdateProfile(id, name, email, password, image) async {
    var request =
        http.MultipartRequest('POST', Uri.parse(baseUrl + updateProfile));

    request.fields.addAll({
      'id': id.toString(),
      'name': name.toString(),
      'email': email.toString(),
      'password': password.toString(),
    });
   if(image != null) {
      request.files.add(await http.MultipartFile.fromPath('avatar', image));
    }

    var response = await request.send();

    if (response.statusCode == 200) {
      return response.stream.bytesToString();
    } else {
      return '';
    }
  }

  Future<dynamic> getExpirydate(user_id) async {
    var response =
        await client.get(Uri.parse(baseUrl + expirydate + "/$user_id"));

    if (response.statusCode == 200) {
      
      return response.body;
    } else {
      return '';
    }
  }
}
