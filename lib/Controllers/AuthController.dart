import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants/routes.dart';
import '../DataAccesslayer/Models/authcode.dart';
import '../DataAccesslayer/Models/user.dart';
import '../DataAccesslayer/Repository/UserRepo.dart';
import '../Services/serviceVar.dart';

class AuthController extends GetxController {
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirmPassword;

   late TextEditingController pinCode; 

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  AuthCode? authCode;

  // static final _box = GetStorage();

  ServiceVar myServices = Get.find();

  UserRepo userRepo = UserRepo();

  late User user;

  void onInit() {
    confirmPassword = TextEditingController();
    name = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    pinCode = TextEditingController();
    super.onInit();
  }



  getRegister() {
    Get.toNamed(AppRoute.register);
  }

  Future getVerifyCode() async {
    if (formstate.currentState!.validate()) {
      // if (password.text == confirmPassword.text) {

      //  if (await userRepo.setCodeVerfiy(email.text) ) {
      print('object');
      authCode = await userRepo.setCodeVerfiy(email.text);

      if (authCode != null && authCode!.message == 'success') {
        Get.toNamed(AppRoute.verifyCode);
      } else {
        // SnackBars.showWarning('رقم الموبايل خاطئ');
      }
      //   Get.toNamed(AppRoute.verifyCode);
      // }

      // }
    } else {}
  }

  Future checkVerifyCode() async {
     print('hi');
    print(pinCode);
   
    //print(authCode.obs);

    Get.toNamed(AppRoute.choosePlan);
  }

  getPaymentMethod() {
    Get.toNamed(AppRoute.paymentMethod);
  }
}

