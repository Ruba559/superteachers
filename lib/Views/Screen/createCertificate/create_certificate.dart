import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:superteachers/Constants/routes.dart';
import '../../../Constants/app_color.dart';
import '../../../Controllers/CreateCertificateController.dart';
import '../../Widgets/button_form.dart';
import '../../Widgets/certificate_choices_box.dart';
import '../../Widgets/layouts/appbar_create_worksheet.dart';
import '../../Widgets/layouts/appdrawar.dart';

class CreateCertificateScreen extends StatelessWidget {
  CreateCertificateScreen({super.key});
  CreateCertificateController controller =
      Get.put(CreateCertificateController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppAppBarCreateWorksheet(
          text: "create_certificate".tr,
          onPressed: () => {Get.offNamed(AppRoute.home) },
        ),
        drawer: AppDrawer(),
        body: Container(
            padding: const EdgeInsets.all(20),
            child: GetBuilder<CreateCertificateController>(
                builder: (controller) => Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Column(
                                children: [
                                  CertificateChoicesBox(
                                    text: 'design_new_certificate'.tr,
                                    body:
                                        "create_new_design".tr,
                                    icon: FontAwesomeIcons.circlePlus,
                                    color: controller.type == 'new'
                                        ? AppColors.primary2
                                        : AppColors.white,
                                    onPressed: () =>
                                        {controller.setType('new')},
                                  ),
                                  CertificateChoicesBox(
                                    text: "using_previous_design".tr,
                                    body:
                                       "using_previous_design_title".tr,
                                    icon: FontAwesomeIcons.file,
                                    color: controller.type == 'old'
                                        ? AppColors.primary2
                                        : AppColors.white,
                                    onPressed: () =>
                                        {controller.setType('old')},
                                  )
                                ],
                              )
                            ],
                          ),
                          Obx(() {
                            return ButtonForm(
                                text: "continue".tr,
                                color: AppColors.secondary,
                                isLoading: controller.isLoading.value,
                                onPressed: () => {
                                      controller.type == 'new'
                                          ? controller.getNewCreateCertificate()
                                          : controller.getDesigns()
                                    });
                          }),
                        ]))));
  }
}
