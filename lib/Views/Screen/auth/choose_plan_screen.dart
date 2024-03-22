import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superteachers/Constants/app_style.dart';
import 'package:superteachers/Constants/app_text_style.dart';
import 'package:superteachers/Views/Widgets/label_form.dart';

import '../../../Constants/app_color.dart';
import '../../../Controllers/AuthController.dart';
import '../../../Functions/valid_input.dart';
import '../../Widgets/button_form.dart';
import '../../Widgets/input_form.dart';

class ChoosePlanScreen extends StatelessWidget {
  const ChoosePlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(5),
              child: GetBuilder<AuthController>(
                  builder: (controller) => Column(children: [
                        Image.asset(
                          'assets/images/logo.png',
                          height: 200,
                          //   fit: BoxFit.fill,
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            width: double.infinity,
                            child: const Text(
                              'اختر خطة التسجيل المناسبة لك',
                              textAlign: TextAlign.start,
                              style: AppTextStyle.body,
                            )),
                        Expanded(
                            child: Container(
                                padding: EdgeInsets.all(10),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 7,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        border: Border.all(
                                            color: AppColors.secondary,
                                            width: 2),
                                        borderRadius: radius20,
                                      ),
                                      margin: EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 6),
                                      child: Row(
                                        //  crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              width: 80,
                                              height: 100,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 4, vertical: 20),
                                              decoration: BoxDecoration(
                                                  color: AppColors.primary2,
                                                  borderRadius: radius20),
                                              child: Text(
                                                'الخطة المجانية',
                                                style: AppTextStyle.body
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold),
                                              )),
                                          Container(
                                              width: 180,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 6),
                                              height: 100,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    'المدة :7 ايام',
                                                    style: AppTextStyle.small
                                                        .copyWith(
                                                      color: AppColors.black,
                                                    ),
                                                    overflow: TextOverflow.fade,
                                                  ),
                                                  Text(
                                                    'عدد الملفات اليومية : 7 ملفات',
                                                    style: AppTextStyle.small
                                                        .copyWith(
                                                      color: AppColors.black,
                                                    ),
                                                    overflow: TextOverflow.fade,
                                                  ),
                                                  Text(
                                                    'عدد الشهادات  :  2  شهادات',
                                                    style: AppTextStyle.small
                                                        .copyWith(
                                                      color: AppColors.black,
                                                    ),
                                                    overflow: TextOverflow.fade,
                                                  ),
                                                ],
                                              )),
                                          Container(
                                              width: 50,
                                              height: 100,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 4, vertical: 10),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: AppColors.grey),
                                                  borderRadius: radius20),
                                              child: Text(
                                                '10998 ل س',
                                                style: AppTextStyle.body
                                                    .copyWith(
                                                        color: AppColors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                overflow: TextOverflow.fade,
                                              )),
                                        ],
                                      ),
                                    );
                                  },
                                ))),
                        ButtonForm(
                            text: "متابعة",
                            color: AppColors.secondary,
                            onPressed: () => controller.getPaymentMethod()),
                      ]))),
        )));
  }
}
