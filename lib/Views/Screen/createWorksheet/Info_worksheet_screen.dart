import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:superteachers/Constants/app_color.dart';
import 'package:superteachers/Constants/app_style.dart';
import 'package:superteachers/Constants/app_text_style.dart';

import '../../../Controllers/CreateWorksheetController.dart';
import '../../../Functions/valid_input.dart';
import '../../Widgets/button_form.dart';
import '../../Widgets/create_worksheet_title .dart';
import '../../Widgets/input_form.dart';
import '../../Widgets/layouts/appbar_create_worksheet.dart';
import '../../Widgets/layouts/appdrawar.dart';

class InfoWorksheetScreen extends StatelessWidget {
  const InfoWorksheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var items = [
      'Item 1',
      'Item 2',
      'Item 3',
      'Item 4',
      'Item 5',
    ];
    String dropdownvalue = 'Item 1';
    CreateWorksheetController controller = Get.find();
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppAppBarCreateWorksheet(
              onPressed: () => {controller.onInit()},
            ),
            drawer: AppDrawer(),
            //  bottomNavigationBar: AppButtomNavBar(),
            body: SingleChildScrollView(child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: GetBuilder<CreateWorksheetController>(
                    builder: (controller) =>Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CreateWeorksheetTitle(
                                  text: 'قم بإضافة شعار المدرسة واسم المعلم/ة'),
                              ListTile(
                                title: Text(
                                  'اختر بيانات محفوظة',
                                  style: AppTextStyle.body
                                      .copyWith(color: AppColors.black),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(color: AppColors.grey),
                                ),
                                child: DropdownButtonFormField(
                                    decoration: const InputDecoration(
                                        border: InputBorder.none
                                        //border:  OutlineInputBorder(borderRadius:radius20 , )
                                        ),
                                    value: dropdownvalue,
                                    itemHeight: 55,
                                    isDense: true,
                                    borderRadius: radius10,
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    items: items.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        enabled: true,
                                        child: Container(
                                            width: 220,
                                            margin: EdgeInsets.all(20),
                                            child: Text(items)),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      dropdownvalue = newValue!;
                                    }),
                              ),
                              ListTile(
                                title: Text(
                                  'إدراج شعار المدرسة',
                                  style: AppTextStyle.body
                                      .copyWith(color: AppColors.black),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(vertical: 30),
                                decoration: BoxDecoration(
                                    borderRadius: radius10,
                                    color: AppColors.primary2),
                                child: Column(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.upload,
                                      size: 50,
                                      color: AppColors.white,
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
                              ListTile(
                                title: Text(
                                  'اسم معلم \ معلمة المادة',
                                  style: AppTextStyle.body
                                      .copyWith(color: AppColors.black),
                                ),
                              ),
                              InputForm(
                                valid: (val) {
                                  return validInput(val!, 3, 20, "password");
                                },
                                mycontroller: controller.search,
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(vertical: 15),
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
                                            ? controller.getInfoWorksheet()
                                            : null
                                      })
                            ])) )))) ;
  }
}
