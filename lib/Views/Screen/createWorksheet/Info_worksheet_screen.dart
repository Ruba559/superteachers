import 'dart:ffi';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:superteachers/Constants/app_color.dart';
import 'package:superteachers/Constants/app_style.dart';
import 'package:superteachers/Constants/app_text_style.dart';
import 'package:superteachers/DataAccesslayer/Models/worksheet.dart';

import '../../../Controllers/CreateWorksheetController.dart';
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
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppAppBarCreateWorksheet(
              onPressed: () => {controller.getWorksheets()},
            ),
            drawer: AppDrawer(),
            resizeToAvoidBottomInset: false,
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
                                      text:
                                          'قم بإضافة شعار المدرسة واسم المعلم/ة'),
                                  ListTile(
                                    title: Text(
                                      'اختر بيانات محفوظة',
                                      style: AppTextStyle.body
                                          .copyWith(color: AppColors.black),
                                    ),
                                  ),
                                  FormField<String>(
                                    builder: (FormFieldState<String> state) {
                                      return InputDecorator(
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.fromLTRB(
                                                12, 10, 20, 20),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0))),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<Worksheet>(
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey,
                                            ),

                                            items: controller.worksheetsByUser
                                                .map<DropdownMenuItem<
                                                            Worksheet>>(
                                                    (Worksheet value) {
                                              return DropdownMenuItem(
                                                value: value,
                                                child: Row(
                                                  children: [
                                                    Text(value.title),
                                                  ],
                                                ),
                                              );
                                            }).toList(),
                                            isExpanded: true,
                                            isDense: true,
                                            // onChanged: null,
                                            onChanged: (newSelectedBank) {
                                              controller.onDropDownItemSelected(
                                                  newSelectedBank);
                                            },
                                            value: controller.choose,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      'إدراج شعار المدرسة',
                                      style: AppTextStyle.body
                                          .copyWith(color: AppColors.black),
                                    ),
                                  ),
                            controller.choose == null ?      Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(vertical: 30),
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
                                              controller.result =
                                                  picked;
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
                                          'اختيار ملف',
                                          style: AppTextStyle.body.copyWith(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ) :Container(

                                    
                               
                                    decoration: BoxDecoration(
                                        borderRadius: radius10,
                                       // color: AppColors.primary2
                                       ),
                                    child:Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

Container(
  width: 160,
      padding: EdgeInsets.symmetric(vertical: 30),
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
                                              controller.result =
                                                  picked;
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
                                          'اختيار ملف',
                                          style: AppTextStyle.body.copyWith(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
),
Image.network(
                                                controller
                                                    .choose!.image,
                                                height: 150,
                                                 width: 160,
                                                //  fit: BoxFit.contain,
                                              ),
                                    ],)
                                  ),
                                  ListTile(
                                    title: Text(
                                      'اسم معلم / معلمة المادة',
                                      style: AppTextStyle.body
                                          .copyWith(color: AppColors.black),
                                    ),
                                  ),
                                  InputForm(
                                    valid: (val) {
                                      return validInput(
                                          val!, 3, 20, "text", null);
                                    },
                                    mycontroller: controller.search,
                                  ),
                                  Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 15),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.check_circle,
                                            color: AppColors.grey,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'حفظ المعلومات لاستخدام مستقبلي',
                                            style: AppTextStyle.small,
                                          )
                                        ],
                                      )),
                                  ButtonForm(
                                      text: "متابعة",
                                      color: controller.worksheet != 0
                                          ? AppColors.secondary
                                          : AppColors.grey,
                                      onPressed: () => {
                                            controller.worksheet != ''
                                                ? controller.createWorksheet()
                                                : null
                                          })
                                ]))))));
  }
}
