import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superteachers/Views/Widgets/label_form.dart';

import '../../../Constants/app_color.dart';
import '../../../Constants/app_text_style.dart';
import '../../../Controllers/LoginController.dart';
import '../../../Functions/valid_input.dart';
import '../../Widgets/button_form.dart';
import '../../Widgets/input_form.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
        backgroundColor: AppColors.primary,
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(30),
                child: GetBuilder<LoginController>(
                    builder: (controller) => ListView(children: [
                          Image.asset(
                            'assets/images/logo.png',
                            height: 200,
                            //   fit: BoxFit.fill,
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              width: double.infinity,
                              child: const Text(
                                'وسيلة الدفع المستخدمة',
                                textAlign: TextAlign.start,
                                style: AppTextStyle.body,
                              )),
                        ])))));
  }
}
