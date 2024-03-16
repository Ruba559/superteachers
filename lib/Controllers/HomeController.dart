import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constants/routes.dart';
import '../DataAccesslayer/Models/user.dart';
import '../DataAccesslayer/Repository/UserRepo.dart';

class HomeController extends GetxController {
  UserRepo userRepo = UserRepo();

  late User user;

  void onInit() {
    super.onInit();
  }

  getClasses() {
    Get.toNamed(AppRoute.classes);
  }

  getSemesters(){
     Get.toNamed(AppRoute.semesters);
  }

    getHome(){
     Get.toNamed(AppRoute.home);
  }
}
