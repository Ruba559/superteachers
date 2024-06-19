import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superteachers/Views/Widgets/create_worksheet_title.dart';
import '../../../Constants/app_color.dart';
import '../../../Controllers/CreateCertificateController.dart';
import '../../../Functions/valid_input.dart';
import '../../Widgets/button_form.dart';
import '../../Widgets/input_form.dart';
import '../../Widgets/label_form.dart';
import '../../Widgets/layouts/appbar_create_worksheet.dart';
import '../../Widgets/layouts/appdrawar.dart';

class TextsScreen extends StatelessWidget {
  TextsScreen({super.key});
 final CreateCertificateController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppAppBarCreateWorksheet(
          text: "create_certificate".tr,
          onPressed: () => {controller.getLogos()},
        ),
        drawer: AppDrawer(),
        body: Container(
            padding: const EdgeInsets.all(20),
            child: GetBuilder<CreateCertificateController>(
                builder: (controller) => SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CreateWeorksheetTitle(text: 'texts'.tr),
                            Form(
                                key: controller.formstatetext,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: LabelForm(
                                        text: 'header'.tr,
                                        color: AppColors.secondary,
                                      ),
                                    ),
                                    InputForm(
                                      hinttext:
                                          'مثال : المملكة العربية السعودية  , مدرسة ............',
                                      isTextarea: 4,
                                      valid: (val) {
                                        return validInput(
                                            val!, 2, 50, "text", true, null);
                                      },
                                      mycontroller: controller.title,
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: LabelForm(
                                        text: "first_text".tr,
                                        color: AppColors.secondary,
                                      ),
                                    ),
                                    InputForm(
                                      hinttext:
                                          'يسر إدارة شركة ...... أن تتقدم بخالص الشكر للسيد\ة',
                                      isTextarea: 4,
                                      valid: (val) {
                                        return validInput(
                                            val!, 2, 50, "text", true, null);
                                      },
                                      mycontroller: controller.subtitle,
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: LabelForm(
                                        text: "second_text".tr,
                                        color: AppColors.secondary,
                                      ),
                                    ),
                                    InputForm(
                                      hinttext:
                                          'مثال : على جهوده في تنمية الشركة , لمساهمته في  ',
                                      isTextarea: 4,
                                      valid: (val) {
                                        return validInput(
                                            val!, 2, 50, "text", true, null);
                                      },
                                      mycontroller: controller.body,
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 30,
                            ),
                            ButtonForm(
                                text: "continue".tr,
                                color: AppColors.secondary,
                                onPressed: () {
                                  controller.getNames();
                                })
                          ]),
                    ))));
  }
}
