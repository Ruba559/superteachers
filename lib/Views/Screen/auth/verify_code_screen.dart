import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:superteachers/Constants/app_style.dart';
import '../../../Constants/app_color.dart';
import '../../../Constants/app_text_style.dart';
import '../../../Controllers/AuthController.dart';
import '../../Widgets/button_form.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: GetBuilder<AuthController>(
              builder: (controller) => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 200,
                        //   fit: BoxFit.fill,
                      ),
                      Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: const Text(
                            'لقد أرسلنا لك رمزاً مكوناً من 6 أرقام قم بإدخاله في المربعات لتأكيد إنشاء الحساب',
                            textAlign: TextAlign.center,
                            style: AppTextStyle.body,
                          )),
                      PinCodeTextField(
                        cursorColor: AppColors.secondary,
                        textStyle: TextStyle(color: AppColors.white),
                        appContext: context,
                        length: 6,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: radius10,
                          inactiveFillColor: AppColors.white,
                          activeColor: AppColors.secondary,
                          selectedFillColor: AppColors.white,
                          selectedColor: AppColors.secondary,
                          inactiveColor: AppColors.white,
                          activeFillColor: AppColors.secondary,
                     
                        ),
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        autoDismissKeyboard: true,
                        keyboardType: TextInputType.number,
                        controller: controller.pinCode,
                        onCompleted: (value) {
                        //  controller.pinCode = value as TextEditingController;
                          controller.isCompleted(value);
                        },
                      ),
                      ButtonForm(
                          text: "تأكيد",
                          color: controller.completed == true
                              ? AppColors.secondary
                              : AppColors.grey,
                          onPressed: () => {controller.checkVerifyCode()}),
                    ],
                  )),
        )));
  }
}
