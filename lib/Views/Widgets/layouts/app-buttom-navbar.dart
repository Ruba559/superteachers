import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:superteachers/Constants/app_color.dart';
import '../../../Constants/routes.dart';
import '../../../main.dart';

class AppButtomNavBar extends StatelessWidget {
  AppButtomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
    //  selectedLabelStyle: UITextStyle.xsmall,
      //unselectedLabelStyle: UITextStyle.xsmall,
      backgroundColor: AppColors.secondary,
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.white.withOpacity(.5),
      currentIndex: MyApp.bottomSelectedItem,
      type: BottomNavigationBarType.fixed,
      onTap: ((value) {
        MyApp.bottomSelectedItem = value;
        switch (value) {
          case 0:
            Get.toNamed(AppRoute.home);
            break;

          case 1:
        Get.toNamed(AppRoute.home);
            break;

          case 2:
          Get.toNamed(AppRoute.home);
            break;

          case 3:
          Get.toNamed(AppRoute.home);
            break;
          case 4:
         Get.toNamed(AppRoute.home);
            break;
        }
      }),
      items: const [
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 3),
            child: Icon(
              FontAwesomeIcons.house,
              size: 24,
            ),
          ),
          label: 'الرئيسية',
        ),
    
  
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 3),
            child: Icon(
              FontAwesomeIcons.bell,
              size: 24,
            ),
          ),
          label: 'الإشعارات',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 3),
            child: Icon(
              FontAwesomeIcons.filePdf,
              size: 24,
            ),
          ),
          label: 'الملفات',
        ),
         BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 3),
            child: Icon(
              Icons.settings,
              size: 24,
            ),
          ),
          label: 'الإعدادات',
        ),
      ],
    );
  }
}
