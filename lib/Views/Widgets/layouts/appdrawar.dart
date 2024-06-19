import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superteachers/Constants/app_text_style.dart';
import 'package:superteachers/Constants/routes.dart';
import 'package:superteachers/Controllers/UserController.dart';
import 'package:superteachers/main.dart';

import '../../../Constants/app_color.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({
    Key? key,
  }) : super(key: key);

final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
   
    return Drawer(
        backgroundColor: AppColors.white,
        child: ListView(children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.primary,
            ),
            accountName: Text(
              MyApp.user != null ? MyApp.user!.name : 'Test User',
            ),
            accountEmail: Text(MyApp.user != null
                ? MyApp.user!.email
                : 'test@superteachers.agency'),
            currentAccountPicture: MyApp.user != null
                ? CircleAvatar(backgroundImage: NetworkImage(MyApp.user!.image))
                : CircleAvatar(
                    backgroundImage: AssetImage('assets/images/logo.png')),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: AppColors.primary,
            ),
            title: Text(
              "home".tr,
              style: AppTextStyle.body.copyWith(
                color: AppColors.primary,
              ),
            ),
            onTap: () {
              Get.toNamed(AppRoute.home);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: AppColors.primary,
            ),
            title: Text(
              "profile".tr,
              style: AppTextStyle.body.copyWith(color: AppColors.primary),
            ),
            onTap: () {
              Get.toNamed(AppRoute.profile);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.folder,
              color: AppColors.primary,
            ),
            title: Text(
              "files".tr,
              style: AppTextStyle.body.copyWith(color: AppColors.primary),
            ),
            onTap: () {
              Get.toNamed(AppRoute.files);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: AppColors.primary,
            ),
            title: Text(
              "settings".tr,
              style: AppTextStyle.body.copyWith(color: AppColors.primary),
            ),
            onTap: () {
           Get.toNamed(AppRoute.settings);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.language,
              color: AppColors.primary,
            ),
            title: Text(
              "switch_locale".tr,
              style: AppTextStyle.body.copyWith(color: AppColors.primary),
            ),
            onTap: () {
              if (Get.locale == Locale('ar')) {
                Get.updateLocale(Locale('en'));
              } else {
                Get.updateLocale(Locale('ar'));
              }
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.black,
            ),
            title: Text(
              "logout".tr,
              style: AppTextStyle.body.copyWith(color: AppColors.primary),
            ),
            onTap: () {
               userController.logout();
            },
          ),
          /* Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                    child: Text(
                      'en',
                      style: AppTextStyle.small,
                    ),
                    onTap: () {
                      localeController.changeLang('en');
                      Navigator.of(context).pop();
                    }),
                InkWell(
                    child: Text(
                      'ar',
                      style: AppTextStyle.small,
                    ),
                    onTap: () {
                      localeController.changeLang('ar');
                      Navigator.of(context).pop();
                    })
              ],
            ),
          ), */
        ]));
  }
}
