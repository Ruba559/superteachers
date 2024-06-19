import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superteachers/Constants/app_text_style.dart';
import 'package:superteachers/Views/Widgets/label_form.dart';

import '../../../Constants/app_color.dart';
import '../../../Controllers/LoginController.dart';
import '../../../Functions/valid_input.dart';
import '../../Widgets/button_form.dart';
import '../../Widgets/input_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
           resizeToAvoidBottomInset: true,
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
                        LabelForm(text: "email".tr),
                        InputForm(
                          valid: (val) {
                            return validInput(val!, 2, 50, "email", true , null);
                          },
                          mycontroller: controller.email,
                        ),
                        LabelForm(text: "password".tr),
                        InputForm(
                          passwordText: true,
                          valid: (val) {
                            return validInput(val!, 3, 20, "password", true ,  null);
                          },
                          mycontroller: controller.password,
                        ),
                        Text(controller.message != '' ? controller.message : '' , style: AppTextStyle.small.copyWith(color: Colors.red),),
                        Obx(()  {return 
                          ButtonForm(
                              text:   "continue".tr ,
                              color: AppColors.secondary,
                              onPressed: () async {
                                controller.login();
                              },
                             isLoading: controller.logging.value
                            );
                        }),
                        ButtonForm(
                            text: "create_new_account".tr,
                            color: AppColors.primary2,
                            onPressed: () => {controller.getRegister()}),
                      ]))),
            )));
  }
}
