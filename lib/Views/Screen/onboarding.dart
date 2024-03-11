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
    return Scaffold(
        backgroundColor: AppColors.primary,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(30),
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
                            children: [
                              Image.asset(
                                onboardingList[i].image!,
                                width: 400,
                                height: 450,
                                //   fit: BoxFit.fill,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                onboardingList[i].title!,
                                textAlign: TextAlign.center,
                                style: AppTextStyle.body,
                              ),
                              const SizedBox(height: 20),
                              Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: Text(
                                    onboardingList[i].body!,
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle.title,
                                  )),
                              const SizedBox(height: 20),
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: radius10),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                onPressed: () => controller.next(),
                                color: AppColors.secondary,
                                textColor: AppColors.white,
                                child: Text('بدء الاستخدام',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        fontFamily: 'Cairo')),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              const SizedBox(height: 70),
                              Image.asset(
                                onboardingList[i].image!,
                                width: 200,
                                height: 230,
                                //   fit: BoxFit.fill,
                              ),
                              const SizedBox(height: 60),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 40),
                                child: Text(onboardingList[i].title!,
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle.title),
                              ),
                              const SizedBox(height: 40),
                              Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: Text(
                                    onboardingList[i].body!,
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle.body,
                                  )),
                              const SizedBox(height: 80),
                              Align(
                                alignment: Alignment.topRight,
                                child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: radius50),
                                  // padding:
                                  //     const EdgeInsets.symmetric(horizontal: -6),
                                  onPressed: () => controller.next(),
                                  color: AppColors.secondary,
                                  textColor: AppColors.white,
                                  child: Icon(
                                    Icons.chevron_right,
                                    size: 50,
                                  ),
                                ),
                              )
                            ],
                          ))),
          ]),
        )));
  }
}
