import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/app_color.dart';
import '../../../Constants/app_text_style.dart';
import '../../../Controllers/AuthController.dart';
import '../../Widgets/button_form.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.find();
    return Scaffold(
            backgroundColor: AppColors.primary,
            body: SafeArea(
                child: Padding(
                    padding: EdgeInsets.all(20),
                    child: 
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                Image.asset(
                        'assets/images/logo.png',
                        height: 200,
                        //   fit: BoxFit.fill,
                      ),
                              Text(
                                'وسيلة الدفع المستخدمة',
                                textAlign: TextAlign.start,
                                style: AppTextStyle.body,
                              ),
                               Obx(() {
                          return ButtonForm(
                                  text: "متابعة",
                                  color: AppColors.secondary,
                                    isLoading: controller.logging.value,
                                  onPressed: () =>
                                      controller.register());
                                       }),
                            ],
                          )),
                    )));
  }
}
