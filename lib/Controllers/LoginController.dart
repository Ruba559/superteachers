import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superteachers/main.dart';
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
  late User user;

  var logging = false.obs;
  
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  login() async {
    if (formstate.currentState!.validate()) {
      logging.value = true;
      if (await userRepo.login(email.text, password.text) != '') {
        late User user;
        user = await userRepo.login(email.text, password.text);

        await boxStorage.setUser(user);
        MyApp.user = user;
        logging.value = false;
        Get.offAllNamed(AppRoute.home);
      }
    }
  }

  getRegister() {
    Get.toNamed(AppRoute.register);
  }

  getUser() async {
   
    user = await boxStorage.getUser();
  }
}
