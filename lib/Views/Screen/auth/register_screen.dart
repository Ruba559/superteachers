import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superteachers/Views/Widgets/label_form.dart';

import '../../../Constants/app_color.dart';
import '../../../Controllers/AuthController.dart';
import '../../../Functions/valid_input.dart';
import '../../Widgets/button_form.dart';
import '../../Widgets/input_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            backgroundColor: AppColors.primary,
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.all(25),
              child: GetBuilder<AuthController>(
                  builder: (controller) => Form(
                      key: controller.formstate,
                      child: ListView(children: [
                        Image.asset(
                          'assets/images/logo.png',
                          height: 200,
                        ),
                        LabelForm(text: 'الاسم'),
                        InputForm(
                          valid: (val) {
                            return validInput(val!, 2, 11, "username", null);
                          },
                          mycontroller: controller.name,
                        ),
                        LabelForm(text: 'البريد الالكتروني'),
                        InputForm(
                          valid: (val) {
                            return validInput(val!, 2, 80, "email", null);
                          },
                          mycontroller: controller.email,
                        ),
                        LabelForm(text: 'كلمة المرور'),
                        InputForm(
                          passwordText: true,
                          valid: (val) {
                            return validInput(val!, 3, 20, "password", null);
                          },
                          mycontroller: controller.password,
                        ),
                        LabelForm(text: ' تاكيد كلمة المرور'),
                        InputForm(
                          passwordText: true,
                          valid: (val) {
                            return validInput(val!, 3, 20, "confirmPassword",
                                controller.password.text);
                          },
                          mycontroller: controller.confirmPassword,
                        ),
                        Obx(() {
                          return ButtonForm(
                              text: "التالي",
                              color: AppColors.secondary,
                               isLoading: controller.logging.value,
                              onPressed: () {
                                controller.getVerifyCode();
                                  
                              });
                        }),
                      ]))),
            ))));
  }
}
