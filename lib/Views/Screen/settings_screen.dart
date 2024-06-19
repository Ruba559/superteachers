import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superteachers/Constants/app_text_style.dart';
import 'package:superteachers/Views/Widgets/layouts/app-buttom-navbar.dart';
import 'package:superteachers/Views/Widgets/layouts/appbar.dart';
import 'package:superteachers/Views/Widgets/layouts/appdrawar.dart';

import '../../../Constants/app_color.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection:
            Get.locale == Locale('ar') ? TextDirection.rtl : TextDirection.ltr,
        child: Scaffold(
            appBar: AppAppBar(),
            drawer: AppDrawer(),
            bottomNavigationBar: AppButtomNavBar(
              selectedIndex: 1,
            ),
            body: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      width: Get.width,
                      child: Title(
                          color: AppColors.primary,
                          child: Text(
                            "settings".tr,
                            textAlign: TextAlign.right,
                            style: AppTextStyle.title.apply(
                                color: AppColors.primary, fontSizeFactor: .8),
                          )),
                    ),
                    Flexible(fit: FlexFit.loose, child: SizedBox())
                  ],
                ))),
      ),
    );
  }
}
