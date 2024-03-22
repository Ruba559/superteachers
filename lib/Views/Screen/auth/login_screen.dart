import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superteachers/Views/Widgets/label_form.dart';

import '../../../Constants/app_color.dart';
import '../../../Controllers/AuthController.dart';
import '../../../Controllers/LoginController.dart';
import '../../../Functions/valid_input.dart';
import '../../Widgets/button_form.dart';
import '../../Widgets/input_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(25),
          child: GetBuilder<LoginController>(
              builder: (controller) => Form(
                  key: controller.formstate,
                  child: ListView(children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 200,
                      //   fit: BoxFit.fill,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    LabelForm(text: 'البريد الالكتروني'),
                    InputForm(
                      valid: (val) {
                        return validInput(val!, 2, 50, "email");
                      },
                      mycontroller: controller.email,
                    ),
                    LabelForm(text: 'كلمة المرور'),
                    InputForm(
                      valid: (val) {
                        return validInput(val!, 3, 20, "password");
                      },
                      mycontroller: controller.password,
                    ),
                    ButtonForm(
                        text: "متابعة",
                        color: AppColors.secondary,
                        onPressed: () => {
                              controller.login()
                            }),
                    ButtonForm(
                        text: "أنشئ حساباً جديداً",
                        color: AppColors.primary2,
                        onPressed: () => {controller.getRegister()}),
                  ]))),
        ))));
  }
}
