import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/app_color.dart';
import '../../Constants/app_style.dart';
import '../../Constants/app_text_style.dart';
import '../../Controllers/OnboardingController.dart';
import '../../Data/OnboardingData.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardingController controller = Get.put(OnboardingController());
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            backgroundColor: AppColors.primary,
            body: SafeArea(
                child: Container(
              padding: EdgeInsets.all(25),
              child: Column(children: [
                Expanded(
                    child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        controller: controller.pageController,
                        onPageChanged: (val) {
                          controller.onPageChanged(val);
                        },
                        itemCount: onboardingList.length,
                        itemBuilder: (context, i) => i == 0
                            ? Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(
                                    onboardingList[i].image!,
                                    width: 400,
                                    height: 450,
                                    //   fit: BoxFit.fill,
                                  ),
                                  Text(
                                    onboardingList[i].title!,
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle.body,
                                  ),
                                  Container(
                                      width: double.infinity,
                                      alignment: Alignment.center,
                                      child: Text(
                                        onboardingList[i].body!,
                                        textAlign: TextAlign.center,
                                        style: AppTextStyle.title,
                                      )),
                                  MaterialButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: radius10),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 30),
                                    onPressed: () => controller.next(),
                                    color: AppColors.secondary,
                                    textColor: AppColors.white,
                                    child: Text('بدء الاستخدام',
                                        style: AppTextStyle.medium.copyWith(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              )
                            : Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(height: 70),
                                  Image.asset(
                                    onboardingList[i].image!,
                                    width: 200,
                                    height: 230,
                                    //   fit: BoxFit.fill,
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 40),
                                    child: Text(onboardingList[i].title!,
                                        textAlign: TextAlign.center,
                                        style: AppTextStyle.title),
                                  ),
                                  Container(
                                      width: double.infinity,
                                      alignment: Alignment.center,
                                      child: Text(
                                        onboardingList[i].body!,
                                        textAlign: TextAlign.center,
                                        style: AppTextStyle.body,
                                      )),
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: AppColors.secondary,
                                            borderRadius: radius50),
                                        child: InkWell(
                                          onTap: () => controller.next(),
                                          child: Icon(
                                            Icons.chevron_left,
                                            size: 60,
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ))
                                ],
                              ))),
              ]),
            ))));
  }
}
