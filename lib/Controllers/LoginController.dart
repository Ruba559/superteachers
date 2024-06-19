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

  var message = '';

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
        message = '';
        update();
        Get.offAllNamed(AppRoute.home);
      } else {
        message = 'data_does_not_match'.tr;
        logging.value = false;
        update();
      }
    }
  }

  getRegister() {
    Get.toNamed(AppRoute.register);
  }


}
