import 'dart:ffi';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:superteachers/Constants/app_color.dart';
import 'package:superteachers/Constants/app_style.dart';
import 'package:superteachers/Constants/app_text_style.dart';
import '../../../Controllers/CreateWorksheetController.dart';
import '../../../DataAccesslayer/Models/user_file.dart';
import '../../../Functions/valid_input.dart';
import '../../Widgets/button_form.dart';
import '../../Widgets/create_worksheet_title.dart';
import '../../Widgets/input_form.dart';
import '../../Widgets/layouts/appbar_create_worksheet.dart';
import '../../Widgets/layouts/appdrawar.dart';

class InfoWorksheetScreen extends StatelessWidget {
  const InfoWorksheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CreateWorksheetController controller = Get.find();
    return Scaffold(
        appBar: AppAppBarCreateWorksheet(
            text: "create_worksheet".tr,
          onPressed: () => {controller.getWorksheets()},
        ),
        drawer: AppDrawer(),
        resizeToAvoidBottomInset: true,
        //  bottomNavigationBar: AppButtomNavBar(),
        body: SingleChildScrollView(
            child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                child: GetBuilder<CreateWorksheetController>(
                    builder: (controller) => Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CreateWeorksheetTitle(
                                  text: "create_worksheet_title".tr),
                              ListTile(
                                title: Text(
                                  "choose_saved_data".tr,
                                  style: AppTextStyle.body
                                      .copyWith(color: AppColors.black),
                                ),
                              ),
                              InputDecorator(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: radius10,
                                  ),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<UserFile>(
                                    value: controller.choose,
                                    isDense: true,
                                    isExpanded: true,
                                    items: controller.worksheetsByUser
                                        .map((UserFile item) =>
                                            DropdownMenuItem<UserFile>(
                                                child: Text(item.title),
                                                value: item))
                                        .toList(),
                                    onChanged: (UserFile? value) {
                                      controller.onDropDownItemSelected(value);
                                    },
                                  ),
                                ),
                              ),
                            
                              ListTile(
                                title: Text(
                                  "insert_the_school_logo".tr,
                                  style: AppTextStyle.body
                                      .copyWith(color: AppColors.black),
                                ),
                              ),
                              controller.choose == null 
                                  ? Container(
                                      width: double.infinity,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 30),
                                      decoration: BoxDecoration(
                                          borderRadius: radius10,
                                          color: AppColors.primary2),
                                      child: Column(
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              var picked = await FilePicker
                                                  .platform
                                                  .pickFiles();

                                              if (picked != null) {
                                                controller.logo = picked;
                                                print(picked.files.first.name);
                                              }
                                            },
                                            child: Icon(
                                              FontAwesomeIcons.upload,
                                              size: 50,
                                              color: AppColors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                           "choose_file".tr,
                                            style: AppTextStyle.body.copyWith(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                        borderRadius: radius10,
                                        // color: AppColors.primary2
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 160,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 30),
                                            decoration: BoxDecoration(
                                                borderRadius: radius10,
                                                color: AppColors.primary2),
                                            child: Column(
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    var picked =
                                                        await FilePicker
                                                            .platform
                                                            .pickFiles();

                                                    if (picked != null) {
                                                      controller.logo = picked;
                                                      print(picked
                                                          .files.first.name);
                                                    }
                                                  },
                                                  child: Icon(
                                                    FontAwesomeIcons.upload,
                                                    size: 50,
                                                    color: AppColors.white,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                  "choose_file".tr,
                                                  style: AppTextStyle.body
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        Image.network(
                                            controller.choose!.logo,
                                            height: 150,
                                            width: 160,
                                            //  fit: BoxFit.contain,
                                          ),
                                        ],
                                      )),
                              ListTile(
                                title: Text(
                                 'teacher_name'.tr,
                                  style: AppTextStyle.body
                                      .copyWith(color: AppColors.black),
                                ),
                              ),
                              InputForm(
                                valid: (val) {
                                  return validInput(val!, 3, 20, "text", true ,  null);
                                },
                                mycontroller: controller.title,
                              ),
                              // Container(
                              //     margin: EdgeInsets.symmetric(vertical: 15),
                              //     child: Row(
                              //       children: [
                              //         Icon(
                              //           Icons.check_circle,
                              //           color: AppColors.grey,
                              //           size: 20,
                              //         ),
                              //         SizedBox(
                              //           width: 10,
                              //         ),
                              //         Text(
                              //           'حفظ المعلومات لاستخدام مستقبلي',
                              //           style: AppTextStyle.small,
                              //         )
                              //       ],
                              //     )),
                              Obx(() {
                                return ButtonForm(
                                    text: "continue".tr,
                                    color: AppColors.secondary,
                                     isLoading: controller.isLoading.value,
                                    onPressed: () =>
                                        {controller.createWorksheet()});
                              })
                            ])))));
  }
}
