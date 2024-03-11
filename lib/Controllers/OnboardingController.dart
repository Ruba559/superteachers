import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../Constants/routes.dart';
import '../Data/OnboardingData.dart';

class OnboardingController extends GetxController {
  late PageController pageController;

  int currentPage = 0;

  next() {
    currentPage++;

    if (currentPage > onboardingList.length - 1) {
   
         Get.offAllNamed(AppRoute.login);
    } else {
    
    
       pageController.jumpToPage(currentPage);
         update();
      //pageController.animateToPage(currentPage,
      //   duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

   onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
