
import 'dart:convert';

import '../Clients/UserClient.dart';
import '../Models/authcode.dart';
import '../Models/expirydate.dart';
import '../Models/user.dart';

class UserRepo {
  UserClient client = UserClient();

  Future<dynamic> register(name, email, password, package_id) async {
    //  if (await client.Register(name, email, password , package_id) != '') {

    var response = await client.Register(name, email, password, package_id);
   
       return User.fromJson(response);
    // } else {
    //   return '';
    // }
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
      var response = await client.Login(email, password);
      return User.fromJson(response);
    } else {
      return '';
    }
  }

Future<dynamic> updateProfile(id, name, email, password , image ) async {
      if (await client.UpdateProfile(id, name, email, password , image ) != '') {

    var response = await client.UpdateProfile(id, name, email, password , image);
   
       return User.fromJson(response);
    } else {
      return '';
    }
  }

  Future<dynamic> getExpirydate(user_id, [id]) async {
    var response = await client.getExpirydate(user_id);
    if (response != null) {
       var parsed = jsonDecode(response);
      return  Expirydate.fromJson(parsed) ;
    }
    return '';
  }

  
}
