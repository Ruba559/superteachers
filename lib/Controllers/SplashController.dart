import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superteachers/Controllers/UserController.dart';

import '../Constants/routes.dart';
import '../DataAccesslayer/Clients/BoxStorage.dart';
import '../main.dart';

class SplashController extends GetxController
    // ignore: deprecated_member_use
    with
        SingleGetTickerProviderMixin {
  UserController userController = Get.find();
  RxDouble progress = 0.0.obs;

  late AnimationController _animationController;
  late Animation<double> animation;

  BoxStorage boxStorage = BoxStorage();
  @override
  void onReady() {
  
      _animationController = AnimationController(
        vsync: this,
        duration: Duration(seconds: 3),
      );
      animation = CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceOut,
      );
      startProgress();
    
    super.onReady();
  }

  // @override
  // void onInit() async {

  //   super.onInit();
  //   _animationController = AnimationController(
  //     vsync: this,
  //     duration: Duration(seconds: 3),
  //   );
  //   animation = CurvedAnimation(
  //     parent: _animationController,
  //     curve: Curves.bounceOut,
  //   );
  //   startProgress();
  // }

  void startProgress() {
    animation.addListener(() {
      progress.value = animation.value;
    });
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
          if (userController.authed == true) {
      if (userController.user != null) {
        MyApp.user = userController.user;
      }
        Get.offAndToNamed(AppRoute.home);
      }
      } else {
      Future.delayed(const Duration(seconds: 3))
          .then((value) => Get.toNamed(AppRoute.onboarding));
    }
    });
    _animationController.forward();
  }

  @override
  void onClose() {
    _animationController.dispose();
    super.onClose();
  }
}
