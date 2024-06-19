import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:superteachers/Constants/app_text_style.dart';
import 'package:superteachers/Constants/routes.dart';
import '../../../Constants/app_color.dart';
import '../../../Constants/app_style.dart';
import '../../../Controllers/CreateCertificateController.dart';
import '../../../Functions/valid_input.dart';
import '../../Widgets/button_form.dart';
import '../../Widgets/create_worksheet_title.dart';
import '../../Widgets/input_form.dart';
import '../../Widgets/layouts/appbar_create_worksheet.dart';
import '../../Widgets/layouts/appdrawar.dart';
import '../shimmer/semesters_shimmer.dart';

class NamesScreen extends StatelessWidget {
  NamesScreen({super.key});
 final CreateCertificateController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppAppBarCreateWorksheet(
          text: "create_certificate".tr,
          onPressed: () => {Get.toNamed(AppRoute.texts)},
        ),
        drawer: AppDrawer(),
        body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CreateWeorksheetTitle(text: 'names'.tr, width: 200),
                            InkWell(
                              onTap: () => {
                                Get.defaultDialog(
                                    middleText: '',
                                    title: 'enter_student_name'.tr,
                                    content: Container(
                                      margin: EdgeInsets.all(20),
                                      child: InputForm(
                                        valid: (val) {
                                          return validInput(
                                              val!, 2, 50, "text", true, null);
                                        },
                                        mycontroller: controller.name,
                                      ),
                                    ),
                                    buttonColor: AppColors.secondary,
                                    confirmTextColor: AppColors.white,
                                    cancelTextColor: AppColors.black,
                                    textConfirm: 'save'.tr,
                                    onConfirm: () {
                                      controller.addName(context);
                                    })
                              },
                              child: Icon(
                                FontAwesomeIcons.circlePlus,
                                color: AppColors.primary2,
                                size: 30,
                              ),
                            )
                          ]),
                      Container(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "student_names_title".tr,
                            style: AppTextStyle.small,
                          ))
                    ],
                  ),
                  GetBuilder(
                      init: controller,
                      builder: (_) => controller.isLoading.value
                          ? SemestersShimmer()
                          : Expanded(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: controller.nameItems.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.lightgrey,
                                          borderRadius: radius20,
                                        ),
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 6, horizontal: 6),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 30),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              controller.nameItems[index].name,
                                              style: AppTextStyle.body.copyWith(
                                                  color: AppColors.grey),
                                            ),
                                            Row(
                                              children: [
                                                InkWell(
                                                  onTap: () => {
                                                    controller.editName(
                                                        controller
                                                            .nameItems[index]
                                                            .name),
                                                    Get.defaultDialog(
                                                        middleText: '',
                                                        title:
                                                            "edit_student_name".tr,
                                                        content: Container(
                                                          margin:
                                                              EdgeInsets.all(
                                                                  20),
                                                          child: InputForm(
                                                            valid: (val) {
                                                              return validInput(
                                                                  val!,
                                                                  2,
                                                                  50,
                                                                  "text",
                                                                  true,
                                                                  null);
                                                            },
                                                            mycontroller:
                                                                controller.name,
                                                          ),
                                                        ),
                                                        buttonColor:
                                                            AppColors.secondary,
                                                        confirmTextColor:
                                                            AppColors.white,
                                                        cancelTextColor:
                                                            AppColors.black,
                                                        textConfirm: 'save'.tr,
                                                        textCancel: 'إالغاء',
                                                        onConfirm: () {
                                                          controller.updateName(
                                                              index, context);
                                                        })
                                                  },
                                                  child: Icon(
                                                    FontAwesomeIcons
                                                        .penToSquare,
                                                    color: AppColors.primary2,
                                                    size: 20,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                InkWell(
                                                  onTap: () => {
                                                    Get.defaultDialog(
                                                        middleText: '',
                                                        title:
                                                            "delete_title".tr,
                                                        buttonColor:
                                                            AppColors.red,
                                                        confirmTextColor:
                                                            AppColors.white,
                                                        cancelTextColor:
                                                            AppColors.black,
                                                        textConfirm: 'delete'.tr,
                                                        onConfirm: () {
                                                          controller.deleteName(
                                                              index, context);
                                                        })
                                                  },
                                                  child: Icon(
                                                    FontAwesomeIcons
                                                        .circleMinus,
                                                    color: AppColors.red,
                                                    size: 20,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ));
                                  }))),
                  ButtonForm(
                      text: "continue".tr,
                      color: AppColors.secondary,
                      onPressed: () => {Get.toNamed(AppRoute.setDateSign)}),
                ])));
  }
}
