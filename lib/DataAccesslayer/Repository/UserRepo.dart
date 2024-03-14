
import '../Clients/UserClient.dart';
import '../Models/User.dart';

class UserRepo {

  UserClient client = UserClient();

  User? user;


  Future<bool> register(String phone) async {
   
      if (await client.register(phone) == true) {
        print('truetrue');
        return true;
      } else {
        return false;
      }
   
  }

  // Future<dynamic> VerifyCode(pin) async {
  
  //     var response = await client.VerifyCode(pin);
  //     if (response != Responses.empty) {
  //       return User.fromJson(response);
  //     }
  //     return null;
    
  // }

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
