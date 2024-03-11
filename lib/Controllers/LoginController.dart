import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constants/routes.dart';

class LoginController extends GetxController {
  late TextEditingController phone;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  //static final _box = GetStorage();

  //ServiceVar myServices = Get.find();

  //LoginRepo repoLogin = LoginRepo();

  //late User user;

  void onInit() {
    phone = TextEditingController();
    super.onInit();
  }

  login() async {
    if (formstate.currentState!.validate()) {
      // if (await repoLogin.Login(phone.text) == true) {
      //  myServices.sharedPreferences.setString("onboarding", "1") ;

      // Get.toNamed(AppRoute.VerifyCode);
      // }
    }
  }

  getRegister() {
    print('object');
    Get.offNamed(AppRoute.register);
  }

  // VerifyCode(String pin) async {
  //   // if (await repoLogin.VerifyCode(pin) != null) {
  //   user = await repoLogin.VerifyCode(pin);
  //   myServices.sharedPreferences.setString("onboarding", "1");

  //   _box.write('user', user);
  //   Userdata.user = _box.read('user');
  //   Get.offAllNamed(AppRoutes.Home);
  //   //   }
  // }
}

// class Userdata {
//   static   late User user  ;


// }
