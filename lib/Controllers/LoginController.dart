import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../Constants/routes.dart';
import '../DataAccesslayer/Models/user.dart';
import '../DataAccesslayer/Repository/UserRepo.dart';
import '../Services/serviceVar.dart';

class LoginController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  static final _box = GetStorage();

  ServiceVar myServices = Get.find();

  UserRepo userRepo = UserRepo();

  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  login() async {
    if (formstate.currentState!.validate()) {
      if (await userRepo.login(email.text, password.text) != '') {
        myServices.sharedPreferences.setString("onboarding", "1");
        late User user;
        user = await userRepo.login(email.text, password.text);

        _box.write('user', user);

        Userdata.user = _box.read('user');

        Get.offAllNamed(AppRoute.home);
      }
    }
  }

  getRegister() {
    Get.toNamed(AppRoute.register);
  }
}

class Userdata {
  static late User user;
}
