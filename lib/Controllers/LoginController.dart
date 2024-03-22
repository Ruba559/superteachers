import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constants/routes.dart';
import '../DataAccesslayer/Clients/BoxStorage.dart';
import '../DataAccesslayer/Models/user.dart';
import '../DataAccesslayer/Repository/UserRepo.dart';

class LoginController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  BoxStorage boxStorage = BoxStorage();


  UserRepo userRepo = UserRepo();

  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  login() async {
    if (formstate.currentState!.validate()) {
      if (await userRepo.login(email.text, password.text) != '') {
        late User user;
        user = await userRepo.login(email.text, password.text);

     //   _box.write('user', user);

       // Userdata.user = _box.read('user');
 await boxStorage.setUser(user);
        Get.offAllNamed(AppRoute.home);
      }
    }
  }

  logout() async {

     await boxStorage.removeUser();
    
    Get.offAllNamed(AppRoute.onboarding);
  }

  getRegister() {
    Get.toNamed(AppRoute.register);
  }
}


