import 'package:get/get.dart';

import '../Controllers/HomeController.dart';
import '../Controllers/UserController.dart';



class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UserController>(UserController());
     Get.put<HomeController>(HomeController());
    //Get.put<LanguageController>(LanguageController());
  }
}