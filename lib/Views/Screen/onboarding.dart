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
       textDirection: Get.locale==Locale('ar') ?  TextDirection.rtl : TextDirection.ltr,
        child: Scaffold(
            backgroundColor: AppColors.primary,
            body: SafeArea(
                child: Container(
              padding: EdgeInsets.all(0),
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
                            ? SizedBox(
                                height: Get.height,
                                width: Get.width,
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Image.asset(
                                      onboardingList[i].image!,
                                      width: Get.width,
                                      height: Get.height,
                                      fit: BoxFit.cover,
                                    ),
                                    Container(
                                      height: 300,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                              colors: [
                                            AppColors.primary,
                                            Color.fromARGB(185, 55, 3, 50),
                                            const Color.fromARGB(0, 55, 3, 100)
                                          ])),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(25),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            onboardingList[i].title!,
                                            textAlign: TextAlign.center,
                                            style: AppTextStyle.body,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                              width: double.infinity,
                                              alignment: Alignment.center,
                                              child: Text(
                                                onboardingList[i].body!,
                                                textAlign: TextAlign.center,
                                                style: AppTextStyle.title,
                                              )),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          MaterialButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: radius10),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 30),
                                            onPressed: () => controller.next(),
                                            color: AppColors.secondary,
                                            textColor: AppColors.white,
                                            child: Text("getting_started".tr,
                                                style: AppTextStyle.medium
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                          ),
                                          SizedBox(
                                            height: 40,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(25),
                                child: Column(
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
                                ),
                              ))),
              ]),
            ))));
  }
}
