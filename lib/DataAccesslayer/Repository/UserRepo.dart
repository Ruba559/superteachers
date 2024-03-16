import 'dart:convert';

import '../Clients/UserClient.dart';
import '../Models/authcode.dart';
import '../Models/user.dart';

class UserRepo {
  UserClient client = UserClient();


  Future<bool> register(String phone) async {
    if (await client.register(phone) == true) {
      print('truetrue');
      return true;
    } else {
      return false;
    }
  }

  Future<dynamic> setCodeVerfiy(email) async {
    var response = await client.setCodeVerfiy(email);
    if (response != null) {
      var parsed = jsonDecode(response);
      return AuthCode.fromJson(parsed);
    } else {
      return null;
    }
  }

  Future<dynamic> login(email, password) async {
    if (await client.Login(email, password) != '') {
      var response =  await client.Login(email, password);
      return User.fromJson(response);
    } else {
      return '';
    }
  }

  // Future<dynamic> getUser(user_id, [id]) async {
  //   var response = await client.getUser(user_id);
  //   if (response != Responses.empty) {
  //     return User.fromJson(response);
  //   }
  //   return null;
  // }

  // Future<dynamic> UpdateProfile(
  //     String name, String phone, String address, int id) async {

  //     var response = await client.UpdateProfile(name, phone, address, id);
  //     if (response != Responses.empty) print('truetrue');
  //     return User.fromJson(response);

  // }
}
