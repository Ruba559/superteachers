import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superteachers/Constants/app_text_style.dart';

import '../../../Constants/app_color.dart';
import '../../../Constants/app_style.dart';
import '../../../Constants/routes.dart';
import '../../../main.dart';

PreferredSize AppAppBar() {
  return PreferredSize(
      preferredSize: Size(Get.width, 60),
      child: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: AppColors.primary,
        elevation: 1,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25)),
        ),
        title: Padding(
            padding: EdgeInsets.all(7),
            child: Column(
              children: [
                Container(
                  child: Text('SUPER TEACHERS',
                      style: AppTextStyle.title.apply(fontSizeFactor: .7)),
                ),
                Text('Apply Worksheets',
                    style: AppTextStyle.medium.apply(fontSizeFactor: .7))
              ],
            )),
        actions: [
         InkWell(
          onTap: () => {
            Get.toNamed(AppRoute.profile)
          }, child:  Container(
            width: 45,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.secondary, width: 1),
                borderRadius: radius50,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: MyApp.user!.image != ''
                    ? Image.network(
                        MyApp.user!.image,
                        height: 30.0,
                        width: 30.0,
                        fit: BoxFit.contain,
                      )
                    : Image.asset(
                        'assets/images/logo.png',
                        width: 30,
                        height: 30,
                        fit: BoxFit.contain,
                      ),
              )))
        ],
      ));
}
