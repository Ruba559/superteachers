import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superteachers/Constants/routes.dart';
import '../../../Constants/app_color.dart';
import '../../../Controllers/CreateCertificateController.dart';
import '../../Widgets/button_form.dart';
import '../../Widgets/create_worksheet_title.dart';
import '../../Widgets/layouts/appbar_create_worksheet.dart';
import '../../Widgets/layouts/appdrawar.dart';

class DesignsScreen extends StatelessWidget {
  DesignsScreen({super.key});
 
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
                            children: [
                              CreateWeorksheetTitle(text: "choose_design".tr),
                              Column(
                                children: [
                               
                                     
                                ],
                              )
                            ],
                          ),
                          ButtonForm(
                              text: "continue".tr,
                              color: AppColors.secondary,
                              onPressed: () => {
                                   controller.getLogos()
                                  }),
                        ]))));
  }
}
