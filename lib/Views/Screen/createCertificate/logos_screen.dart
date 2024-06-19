import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:superteachers/Constants/routes.dart';
import '../../../Constants/app_color.dart';
import '../../../Constants/app_style.dart';
import '../../../Constants/app_text_style.dart';
import '../../../Controllers/CreateCertificateController.dart';
import '../../Widgets/button_form.dart';
import '../../Widgets/create_worksheet_title.dart';
import '../../Widgets/layouts/appbar_create_worksheet.dart';
import '../../Widgets/layouts/appdrawar.dart';
import '../../Widgets/logo_box.dart';
import '../shimmer/subject_shimmer.dart';

class LogosScreen extends StatelessWidget {
  LogosScreen({super.key});
   final CreateCertificateController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppAppBarCreateWorksheet(
          text: "create_certificate".tr,
          onPressed: () => {controller.getNewCreateCertificate()},
        ),
        drawer: AppDrawer(),
        body: Container(
            padding: const EdgeInsets.all(20),
            child: GetBuilder<CreateCertificateController>(
                builder: (controller) => Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CreateWeorksheetTitle(
                                      text: "choose_logo".tr, width: 200),
                                  ElevatedButton(
                                    onPressed: () {
                                      Get.defaultDialog(
                                        middleText: '',
                                        title: '',
                                        content: Column(
                                          children: [
                                            InkWell(
                                                onTap: () async {
                                                  var picked = await FilePicker
                                                      .platform
                                                      .pickFiles();

                                                  if (picked != null) {
                                                    controller.logo_file =
                                                        picked;
                                                    print(picked
                                                        .files.first.name);
                                                  }
                                                },
                                                child: Column(
                                                  children: [
                                                    Icon(
                                                      FontAwesomeIcons.upload,
                                                      size: 20,
                                                      color: AppColors.primary,
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Text(
                                                      'choose_logo'.tr,
                                                      style: AppTextStyle.body
                                                          .copyWith(
                                                              color: AppColors
                                                                  .black),
                                                    ),
                                                  ],
                                                )),
                                            Obx(() {
                                              return ButtonForm(
                                                text: 'save',
                                                color: AppColors.secondary,
                                                 isLoading: controller.isLoading.value,
                                                width: 10,
                                                onPressed: () => {
                                                  controller.addLogo(context)
                                                },
                                              );
                                            }),
                                          ],
                                        ),
                                        buttonColor: AppColors.secondary,
                                        confirmTextColor: AppColors.white,
                                        cancelTextColor: AppColors.black,
                                        //  textConfirm: 'save'.tr,

                                        // onConfirm: () {
                                        //   controller.addLogo(context);
                                        // }
                                      );
                                    },
                                    style: ButtonStyle(
                                        shape: MaterialStatePropertyAll<
                                            RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: radius10,
                                      ),
                                    )),
                                    child: Text(
                                      "add_new".tr,
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                      style: AppTextStyle.small
                                          .copyWith(color: AppColors.white),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Flexible(
                                  child: GetBuilder(
                                init: controller,
                                builder: (_) => controller.isLoading.value
                                    ? SubjectShimmer()
                                    : GridView.count(
                                        crossAxisCount: 2,
                                        children: List.generate(
                                            controller.logos.length, (index) {
                                          return LogoBox(
                                            image:
                                                controller.logos[index].image,
                                            bordercolor: controller.logo_id ==
                                                    controller.logos[index].id
                                                ? AppColors.secondary
                                                : AppColors.grey,
                                            onPressed: () => {
                                              controller.setLogo(
                                                  controller.logos[index].id)
                                            },
                                          );
                                        }),
                                      ),
                              ))
                            ],
                          )),
                          ButtonForm(
                              text: "continue".tr,
                              color: controller.logo_id != 0
                                  ? AppColors.secondary
                                  : AppColors.grey,
                              onPressed: () => {
                                    controller.logo_id != 0
                                        ? Get.toNamed(AppRoute.texts)
                                        : null
                                  }),
                        ]))));
  }
}
