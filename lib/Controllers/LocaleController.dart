import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocaleController extends GetxController {
  Locale? language;

  final box = GetStorage();

  void onInit() {
    language = Get.deviceLocale;
    Get.updateLocale(language!);
 
    super.onInit();
  }

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    box.write('lang', langcode);
    Get.updateLocale(locale);
  }
}
