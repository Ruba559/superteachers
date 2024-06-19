import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superteachers/Views/Widgets/label_form.dart';
import '../../../Constants/app_color.dart';
import '../../../Constants/app_style.dart';
import '../../../Constants/routes.dart';
import '../../../Controllers/CreateCertificateController.dart';
import '../../../DataAccesslayer/Models/certificate.dart';
import '../../Widgets/button_form.dart';
import '../../Widgets/create_worksheet_title.dart';
import '../../Widgets/layouts/appbar_create_worksheet.dart';
import '../../Widgets/layouts/appdrawar.dart';

class CreateNewCertificateScreen extends StatelessWidget {
  CreateNewCertificateScreen({super.key});
 final CreateCertificateController controller =
      Get.put(CreateCertificateController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppAppBarCreateWorksheet(
          text: "create_certificate".tr,
          onPressed: () => { Get.toNamed(AppRoute.createCertificate)},
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
                              CreateWeorksheetTitle(text: 'design_new_certificate'.tr),
                              Column(
                                children: [
                                Container(margin: EdgeInsets.all(12), child: 
                                Image.asset(
                                    'assets/images/certificate-icon.png',
                                  ),),  
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: LabelForm(
                                      text: "started_choose_certificate".tr,
                                      color: AppColors.black,
                                    ),
                                  ),
                                       InputDecorator(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: radius10,
                                  ),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<Certificate>(
                                    value: controller.certificateType,
                                    isDense: true,
                                    isExpanded: true,
                                    items: controller.certificates
                                        .map((Certificate item) =>
                                            DropdownMenuItem<Certificate>(
                                                child: Text(item.name),
                                                value: item))
                                        .toList(),
                                    onChanged: (Certificate? value) {
                                     controller.selectCertificateType(value);
                                    },
                                  ),
                                ),
                              ),
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
