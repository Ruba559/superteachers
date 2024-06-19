import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superteachers/Constants/app_style.dart';
import 'package:superteachers/Constants/app_text_style.dart';

import '../../../Constants/app_color.dart';
import '../../../Controllers/AuthController.dart';
import '../../Widgets/button_form.dart';

class ChoosePlanScreen extends StatelessWidget {
  const ChoosePlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                                child:  ListTile(
                                  title: Text(
                                    "select_plan".tr,
                                    textAlign: TextAlign.start,
                                    style: AppTextStyle.body,
                                  ),
                                )),
                            Expanded(
                                child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: controller.packages.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return InkWell(
                                          onTap: () => {
                                            controller.setPlan(
                                                controller.packages[index].id)
                                          },
                                          child: Container(
                                             height: 100,
                                            decoration: BoxDecoration(
                                              color: AppColors.white,
                                              border: Border.all(
                                                  color: controller
                                                              .packages[index]
                                                              .id ==
                                                          controller.plan
                                                      ? AppColors.secondary
                                                      : AppColors.grey,
                                                  width: 2),
                                              borderRadius: radius20,
                                            ),
                                            margin: EdgeInsets.symmetric(
                                                vertical: 6, horizontal: 6),
                                                
                                            child:  Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                             mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                    flex: 2,
                                                    child: Container(
                                                 
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 4,
                                                               
                                                               ),
                                                        decoration:
                                                            BoxDecoration(
                                                                color: AppColors
                                                                    .primary2,
                                                                borderRadius:
                                                                    radius20),
                                                        child: Center(
                                                          child:Text(
                                                          controller
                                                              .packages[index]
                                                              .name,
                                                          style: AppTextStyle
                                                              .body
                                                              .copyWith(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ) ,) )),
                                                Expanded(
                                                    flex: 4,
                                                    child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 6),
                                                   
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Text.rich(TextSpan(
                                                                text:
                                                                    'duration'.tr,
                                                                style:
                                                                    AppTextStyle
                                                                        .xsmall
                                                                        .copyWith(
                                                                  color:
                                                                      AppColors
                                                                          .black,
                                                                ),
                                                                children: <InlineSpan>[
                                                                  TextSpan(
                                                                    style: AppTextStyle
                                                                        .small
                                                                        .copyWith(
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                    text: controller
                                                                        .packages[
                                                                            index]
                                                                        .days_count
                                                                        .toString(),
                                                                  ),
                                                                  TextSpan(
                                                                    text:
                                                                        "day".tr, style:
                                                                    AppTextStyle
                                                                        .xsmall
                                                                        .copyWith(
                                                                  color:
                                                                      AppColors
                                                                          .black,
                                                                )
                                                                  )
                                                                ])),
                                                            Text.rich(TextSpan(
                                                                text:
                                                                    "files_counts".tr,
                                                                style:
                                                                    AppTextStyle
                                                                        .xsmall
                                                                        .copyWith(
                                                                  color:
                                                                      AppColors
                                                                          .black,
                                                                ),
                                                                children: <InlineSpan>[
                                                                  TextSpan(
                                                                    style: AppTextStyle
                                                                        .small
                                                                        .copyWith(
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                    text: controller
                                                                        .packages[
                                                                            index]
                                                                        .file_count
                                                                        .toString(),
                                                                  ),
                                                                  TextSpan(
                                                                    text:
                                                                        "file", style:
                                                                    AppTextStyle
                                                                        .xsmall
                                                                        .copyWith(
                                                                  color:
                                                                      AppColors
                                                                          .black,
                                                                )
                                                                  )
                                                                ])),
                                                            Text.rich(TextSpan(
                                                                text:
                                                                    "certificate_counts".tr,
                                                                style:
                                                                    AppTextStyle
                                                                        .xsmall
                                                                        .copyWith(
                                                                  color:
                                                                      AppColors
                                                                          .black,
                                                                ),
                                                                children: <InlineSpan>[
                                                                  TextSpan(
                                                                    style: AppTextStyle
                                                                        .small
                                                                        .copyWith(
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                    text: controller
                                                                        .packages[
                                                                            index]
                                                                        .certificate_count
                                                                        .toString(),
                                                                  ),
                                                                  TextSpan(
                                                                    text:
                                                                       "certificate".tr, style:
                                                                    AppTextStyle
                                                                        .xsmall
                                                                        .copyWith(
                                                                  color:
                                                                      AppColors
                                                                          .black,
                                                                )
                                                                  )
                                                                ])),
                                                          ],
                                                        ))),
                                                Expanded(
                                                    flex: 2,
                                                    child: Container(
                                                   
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 4,
                                                                vertical: 10),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: AppColors
                                                                    .grey),
                                                            borderRadius:
                                                                radius20),
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                          
                                                          Text(
                                                         controller.packages[
                                                                            index]
                                                                        .price
                                                                        .toString(),
                                                          style: AppTextStyle
                                                              .body
                                                              .copyWith(
                                                                  color:
                                                                      AppColors
                                                                          .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                          overflow:
                                                              TextOverflow.fade,
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Text('ر.س' ,style: AppTextStyle
                                                              .body
                                                              .copyWith(
                                                                  color:
                                                                      AppColors
                                                                          .black,
                                                                          
                                                                 ),  textAlign:
                                                              TextAlign.center,)
                                                        ],) )),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ))),
                            ButtonForm(
                                    text: "continue".tr ,
                                color: controller.plan != 0
                                    ? AppColors.secondary
                                    : AppColors.grey,
                                onPressed: () => controller.getPaymentMethod()),
                          ]))),
            ));
  }
}
