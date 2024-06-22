import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superteachers/Constants/app_color.dart';
import 'package:superteachers/Constants/app_text_style.dart';
import 'package:superteachers/Constants/routes.dart';
import 'package:superteachers/Controllers/AuthController.dart';
import 'package:superteachers/Views/Widgets/button_form.dart';
import '../../Widgets/layouts/appdrawar.dart';

class AccountCreatedScreen extends StatelessWidget {
  const AccountCreatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
           backgroundColor: AppColors.primary,
           
            drawer: AppDrawer(),
            //  bottomNavigationBar: AppButtomNavBar(),
            body: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),
                child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                                Image.asset(
                              'assets/images/logo.png',
                              height: 200,
                              //   fit: BoxFit.fill,
                            ),
                              Container(
                                padding: EdgeInsets.all(30),
                                decoration: BoxDecoration(
                                    color: AppColors.secondary,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(80))),
                                child: Icon(
                                  Icons.done_all,
                                  size: 100,
                                  color: AppColors.white,
                                ),
                              ),
                              Text(
                                "account_created".tr,
                                style: AppTextStyle.medium
                                    ,
                              ),
                           ButtonForm(text: "continue_to_home".tr, color: AppColors.secondary,
                           onPressed: () => {
                            Get.offAllNamed(AppRoute.home)
                           },
                           )
                            ])));
  }
}
