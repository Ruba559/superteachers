import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constants/routes.dart';
import '../DataAccesslayer/Clients/BoxStorage.dart';
import '../DataAccesslayer/Models/user.dart';
import '../DataAccesslayer/Repository/UserRepo.dart';
import '../main.dart';

class HomeController extends GetxController {
  UserRepo userRepo = UserRepo();
 BoxStorage boxStorage = BoxStorage();
  late User user;

  void onInit() {
    super.onInit();
  }



  getSemesters(){
     Get.toNamed(AppRoute.semesters);
  }

    getHome(){
     Get.toNamed(AppRoute.home);
  }

  
  logout() async {
    await boxStorage.removeUser();
 MyApp.user = null;
    Get.offAllNamed(AppRoute.onboarding);
  }
}
