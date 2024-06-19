import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superteachers/Constants/app_color.dart';

import '../../Controllers/SplashController.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: Get.width / 1,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Obx(
              () => LinearProgressIndicator(
                value: controller.progress.value,
                minHeight: 5,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.secondary),
              ),
            ),
          )
        ],
      )),
    );
  }
}
