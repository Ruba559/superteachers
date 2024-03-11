import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superteachers/Views/Widgets/label_form.dart';

import '../../../Constants/app_color.dart';
import '../../../Controllers/LoginController.dart';
import '../../../Functions/valid_input.dart';
import '../../Widgets/button_form.dart';
import '../../Widgets/input_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
        backgroundColor: AppColors.primary,
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(30),
                child:
               
                  
                    GetBuilder<LoginController>(
                    builder: (controller) => Form(
                               key: controller.formstate,
                            child: ListView(children: [
                         Image.asset('assets/images/logo.png',
                                //   fit: BoxFit.fill,
                                height: 200,

                              ),
                          LabelForm(text: 'الاسم'),
                          InputForm(
                            valid: (val) {
                              return validInput(val!, 9, 11, "phone");
                            },
                            mycontroller: controller.phone,
                           
                          ),
                           LabelForm(text: 'البريد الالكتروني'),
                          InputForm(
                            valid: (val) {
                              return validInput(val!, 9, 11, "phone");
                            },
                            mycontroller: controller.phone,
                           
                          ),
                            LabelForm(text: 'كلمة المرور'),
                          InputForm(
                            valid: (val) {
                              return validInput(val!, 3 , 20, "password");
                            },
                            mycontroller: controller.phone,
                           
                          ),
                            LabelForm(text: ' تاكيد كلمة المرور' ),
                          InputForm(
                            valid: (val) {
                              return validInput(val!, 3 , 20, "password");
                            },
                            mycontroller: controller.phone,
                           
                          ),
                          ButtonForm(
                              text: "التالي",
                              color: AppColors.secondary,
                              onPressed: () {
                                //controller.login();
                              }),
                         
                        ])))
                ,)
               ));
  }
}
