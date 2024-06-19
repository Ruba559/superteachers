import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superteachers/Constants/routes.dart';
import '../../../Constants/app_color.dart';
import '../../../Controllers/CreateCertificateController.dart';
import '../../Widgets/button_form.dart';
import '../../Widgets/create_worksheet_title.dart';
import '../../Widgets/layouts/appbar_create_worksheet.dart';
import '../../Widgets/layouts/appdrawar.dart';

class PreviewDownloadScreen extends StatelessWidget {
  PreviewDownloadScreen({super.key});
 final CreateCertificateController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppAppBarCreateWorksheet(
          text: "create_certificate".tr,
          onPressed: () => {Get.offAllNamed(AppRoute.home)},
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
                              CreateWeorksheetTitle(text: "preview_download".tr),
                              SizedBox(
                                height: 30,
                              ),
                              Column(
                                children: [],
                              )
                            ],
                          ),
                          Obx(() {
                            return ButtonForm(
                                text: "save_download".tr,
                                color: AppColors.secondary,
                                isLoading: controller.isLoading.value,
                                onPressed: () => {
                                      controller.type == 'new'
                                          ? controller.getNewCreateCertificate()
                                          : Get.offAllNamed(AppRoute.home)
                                    });
                          }),
                        ]))));
  }
}
