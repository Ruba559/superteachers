import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constants/routes.dart';
import '../DataAccesslayer/Clients/BoxStorage.dart';
import '../DataAccesslayer/Models/authcode.dart';
import '../DataAccesslayer/Models/package.dart';
import '../DataAccesslayer/Models/user.dart';
import '../DataAccesslayer/Repository/PackageRepo.dart';
import '../DataAccesslayer/Repository/UserRepo.dart';
import '../main.dart';

class AuthController extends GetxController {
  late TextEditingController name = TextEditingController();
  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();
  late TextEditingController confirmPassword = TextEditingController();

  late TextEditingController pinCode = TextEditingController();

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  AuthCode? authCode;

  BoxStorage boxStorage = BoxStorage();

  UserRepo userRepo = UserRepo();
  PackageRepo packageRepo = PackageRepo();

  List<Package> packages = [];

   var logging = false.obs;

  late User user;
  late bool completed;
  int plan = 0;

  void onInit() {
    completed = false;
    plan = 0;
    super.onInit();
  }

  setPlan(value) {
    plan = value;
    update();
  }

  getRegister() {
    Get.toNamed(AppRoute.register);
  }

  Future getVerifyCode() async {
    if (formstate.currentState!.validate()) {
         logging.value = true;
      authCode = await userRepo.setCodeVerfiy(email.text);

      if (authCode != null && authCode!.message == 'success') {
         
        Get.toNamed(AppRoute.verifyCode);
      }
        logging.value = false;
    }
  }

  Future checkVerifyCode() async {
    print(authCode!.otp);
    //if (pinCode.text == authCode!.otp) {
    packages = await packageRepo.getPackages();

    Get.toNamed(AppRoute.choosePlan);
    // } else {}
  }

  isCompleted(value) {
    completed = true;
    pinCode.text = value;
    update();
  }

  getPaymentMethod() {
    Get.toNamed(AppRoute.paymentMethod);
  }

  Future register() async {
    // if (await userRepo.register(name.text, email.text, password.text, plan) !=
    //     '') {
      late User user;
        logging.value = true;
      user = await userRepo.register(name.text, email.text, password.text, plan);
    
      await boxStorage.setUser(user);
       MyApp.user = user;
        logging.value = false;
      Get.offAllNamed(AppRoute.accountCreated);
   // }
  }

    getAccountCreated() {

      Get.offAllNamed(AppRoute.home);
   
  }
}
