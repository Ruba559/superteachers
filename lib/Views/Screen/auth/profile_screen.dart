import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:superteachers/Views/Widgets/layouts/appbar.dart';
import 'package:superteachers/Views/Widgets/layouts/appdrawar.dart';

import '../../../Constants/app_color.dart';
import '../../../Constants/app_text_style.dart';
import '../../../Controllers/ProfileController.dart';
import '../../../Functions/valid_input.dart';
import '../../../main.dart';
import '../../Widgets/button_form.dart';
import '../../Widgets/input_form.dart';
import '../../Widgets/label_form.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});
  final  ProfileController controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
      child: Directionality(
        textDirection:
            Get.locale == Locale('ar') ? TextDirection.rtl : TextDirection.ltr,
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppAppBar(),
            drawer: AppDrawer(),
            body: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width,
                      child: Title(
                          color: AppColors.primary,
                          child: Text(
                            "profile".tr,
                            textAlign: TextAlign.right,
                            style: AppTextStyle.title.apply(
                                fontSizeFactor: .8, color: AppColors.primary),
                          )),
                    ),
                    // Flexible(fit: FlexFit.loose, child: SizedBox()),
                    SizedBox(
                      height: 50,
                    ),
                    Expanded(
                        child: GetBuilder<ProfileController>(
                            builder: (controller) => ListView(children: [
                                  SizedBox(
                                    height: 130,
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      alignment: Alignment.center,
                                      fit: StackFit.loose,
                                      children: [
                                        CircleAvatar(
                                          minRadius: 50,
                                          backgroundColor: AppColors.white,
                                          child: ClipOval(
                                            child: controller.image != null
                                                ? Image.file(
                                                    controller.image!,
                                                    fit: BoxFit.contain,
                                                  )
                                                : MyApp.user!.image != ''
                                                    ? Image.network(
                                                        MyApp.user!.image,
                                                        fit: BoxFit.contain,
                                                      )
                                                    : Image.asset(
                                                        'assets/images/logo.png',
                                                        fit: BoxFit.contain,
                                                      ),
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 3,
                                            left: 0,
                                            right: -65,
                                            child: InkWell(
                                              onTap: () async {
                                                await controller.selectImage();
                                              },
                                              child: Container(
                                                child: Icon(
                                                  FontAwesomeIcons
                                                      .solidPenToSquare,
                                                  color: AppColors.primary,
                                                  size: 18,
                                                ),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                  LabelForm(
                                      text: 'الاسم', color: AppColors.black),
                                  InputForm(
                                    valid: (val) {
                                      return validInput(
                                          val!, 2, 11, "username", true, null);
                                    },
                                    mycontroller: controller.name,
                                  ),
                                  LabelForm(
                                      text: "email".tr, color: AppColors.black),
                                  InputForm(
                                    valid: (val) {
                                      return validInput(
                                          val!, 2, 80, "email", true, null);
                                    },
                                    mycontroller: controller.email,
                                  ),
                                  LabelForm(
                                      text: "password".tr,
                                      color: AppColors.black),
                                  InputForm(
                                    passwordText: true,
                                    valid: (val) {
                                      return validInput(
                                          val!, 3, 20, "password", false, null);
                                    },
                                    mycontroller: controller.password,
                                  ),
                                  Text(
                                    'password_title'.tr,
                                    style: AppTextStyle.xsmall
                                        .copyWith(color: AppColors.white),
                                  ),
                                  SizedBox(height: 10),
                                  Obx(() {
                                    return ButtonForm(
                                        text: 'save'.tr,
                                        color: AppColors.secondary,
                                        onPressed: () async {
                                          controller.updateProfile();
                                        },
                                        isLoading: controller.isLoading.value);
                                  }),
                                ]))),
                  ],
                ))),
      ),
    );
  }
}
