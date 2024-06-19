import 'package:get_storage/get_storage.dart';

import '../Models/user.dart';

class BoxStorage{
  final box = GetStorage();


 Future<User> getAuthedUser() async {
    print(await box.read('super_userdata'));
    return User.fromMap(await box.read('super_userdata'));
  }

    Future<bool> getAuthState() async {
    print(box.read('super_authed'));
    if (await box.read('super_authed') != null) {
      return true;
    }
    return false;
  }

 Future<void> setUser(User user) async {
    await box.write('super_authed', true);
    await box.write('super_userdata', user.toMap());
  }


  Future<void> removeUser() async {
    await box.remove('super_authed');
    await box.remove('super_userdata');
  }

}