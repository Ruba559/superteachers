import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../Constants/app_color.dart';
import '../../../Controllers/CreateCertificateController.dart';
import '../../../Functions/valid_input.dart';
import '../../Widgets/button_form.dart';
import '../../Widgets/create_worksheet_title.dart';
import '../../Widgets/input_form.dart';
import '../../Widgets/label_form.dart';
import '../../Widgets/layouts/appbar_create_worksheet.dart';
import '../../Widgets/layouts/appdrawar.dart';

class SetDateSignScreen extends StatelessWidget {
  SetDateSignScreen({super.key});
 final CreateCertificateController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppAppBarCreateWorksheet(
          text: "create_certificate".tr,
          onPressed: () => {controller.getNames()},
        ),
        drawer: AppDrawer(),
        body: Container(
            padding: const EdgeInsets.all(20),
            child: GetBuilder<CreateCertificateController>(
                builder: (controller) => Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Form(
                                key: controller.formstatedate,
                                child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CreateWeorksheetTitle(text: "date_sign".tr),
                              SizedBox(
                                height: 30,
                              ),
                              Column(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: LabelForm(
                                      text: "date_granting_certificate".tr,
                                      color: AppColors.secondary,
                                    ),
                                  ),
                                  InputForm(
                                    valid: (val) {
                                      return validInput(
                                          val!, 2, 50, "text", true, null);
                                    },
                                    mycontroller: controller.datePickerController,
                                     onTap:  () => controller.onTapFunction(context: context),
                                     hinttext:  DateFormat('yyyy-MM-dd').format(DateTime.now()),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: LabelForm(
                                      text:
                                         "name_sign".tr,
                                      color: AppColors.secondary,
                                    ),
                                  ),
                                  InputForm(
                                    valid: (val) {
                                      return validInput(
                                          val!, 2, 50, "text", true, null);
                                    },
                                    mycontroller: controller.sign,
                                  ),
                                  CreateWeorksheetTitle(text: "certificate_design".tr),
                                ],
                              )
                            ],
                           )),
                          Obx(() {
                            return ButtonForm(
                                text: "continue".tr,
                                color: AppColors.secondary,
                                isLoading: controller.isLoading.value,
                                onPressed: () =>
                                    {controller.getPreviewDownload()});
                          }),
                        ]))));
  }
}
