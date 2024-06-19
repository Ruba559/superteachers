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
    return  Scaffold(
           resizeToAvoidBottomInset: true,
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
                            return validInput(val!, 2, 11, "username", true ,  null);
                          },
                          mycontroller: controller.name,
                        ),
                        LabelForm(text:  "email".tr),
                        InputForm(
                          valid: (val) {
                            return validInput(val!, 2, 80, "email",true ,  null);
                          },
                          mycontroller: controller.email,
                        ),
                        LabelForm(text: "password".tr),
                        InputForm(
                          passwordText: true,
                          valid: (val) {
                            return validInput(val!, 3, 20, "password",true ,  null);
                          },
                          mycontroller: controller.password,
                        ),
                        LabelForm(text: "confirm_password".tr),
                        InputForm(
                          passwordText: true,
                          valid: (val) {
                            return validInput(val!, 3, 20, "confirmPassword",true , 
                                controller.password.text);
                          },
                          mycontroller: controller.confirmPassword,
                        ),
                        Obx(() {
                          return ButtonForm(
                              text:   "continue".tr ,
                              color: AppColors.secondary,
                               isLoading: controller.logging.value,
                              onPressed: () {
                                controller.getVerifyCode();
                                  
                              });
                        }),
                      ]))),
            )));
  }
}
