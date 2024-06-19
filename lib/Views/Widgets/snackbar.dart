import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superteachers/Constants/app_color.dart';
import 'package:superteachers/Constants/app_text_style.dart';

class SnackBars {
  static void showSuccess(message) {
    Get.rawSnackbar(
        snackPosition: SnackPosition.TOP,
        padding: const EdgeInsets.symmetric(vertical: 15),
        messageText: Text(
          message,
          style: AppTextStyle.body,
          textAlign: TextAlign.center,
        ),
        duration: const Duration(seconds: 2),
       backgroundColor: AppColors.green);
  }

  static void showError(message) {
    Get.rawSnackbar(
        padding: const EdgeInsets.symmetric(vertical: 15),
        messageText: Text(
          message,
           style: AppTextStyle.body,
          textAlign: TextAlign.center,
        ),
        duration: const Duration(seconds: 2),
        backgroundColor:Colors.red);
  }

  static void showWarning(message) {
    Get.rawSnackbar(
      dismissDirection: DismissDirection.horizontal,
        padding: const EdgeInsets.symmetric(vertical: 25),
        margin: EdgeInsets.symmetric(vertical: 300),
        messageText: Text(
          message,
           style: AppTextStyle.body,
          textAlign: TextAlign.center,
        ),
       duration: const Duration(seconds: 3),
        backgroundColor: AppColors.grey);
  }
}