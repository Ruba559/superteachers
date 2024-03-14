import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constants/routes.dart';
import '../DataAccesslayer/Models/user.dart';
import '../DataAccesslayer/Repository/UserRepo.dart';
import '../Services/serviceVar.dart';

class LoginController extends GetxController {
  late TextEditingController phone;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  // static final _box = GetStorage();

  ServiceVar myServices = Get.find();

  UserRepo userRepo = UserRepo();

  late User user;

  void onInit() {
    phone = TextEditingController();
    super.onInit();
  }

  register() async {
    if (formstate.currentState!.validate()) {
      if (await userRepo.register(phone.text) == true) {
        myServices.sharedPreferences.setString("onboarding", "1");

        Get.toNamed(AppRoute.verifyCode);
      }
    }
  }

  getRegister() {
    print('object');
    Get.toNamed(AppRoute.register);
  }

  getVerifyCode() {
    Get.toNamed(AppRoute.verifyCode);
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

  getChoosePlan() {
    Get.toNamed(AppRoute.choosePlan);
  }

  getPaymentMethod() {
     Get.toNamed(AppRoute.paymentMethod);
  }
}



// class Userdata {
//   static   late User user  ;


// }
