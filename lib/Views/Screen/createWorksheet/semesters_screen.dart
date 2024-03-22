import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superteachers/Constants/app_text_style.dart';
import '../../../Constants/app_color.dart';
import '../../../Controllers/CreateWorksheetController.dart';
import '../../../Controllers/HomeController.dart';
import '../../Widgets/button_form.dart';
import '../../Widgets/class_box.dart';
import '../../Widgets/create_worksheet_title .dart';
import '../../Widgets/layouts/appbar_create_worksheet.dart';
import '../../Widgets/layouts/appdrawar.dart';

class SemestersScreen extends StatelessWidget {
  const SemestersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CreateWorksheetController controller = Get.put(CreateWorksheetController());
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppAppBarCreateWorksheet(
              onPressed: () => {controller.getHome()},
            ),
            drawer: AppDrawer(),
            //  bottomNavigationBar: AppButtomNavBar(),
            body: Container(
                padding: const EdgeInsets.all(20),
                child: GetBuilder<CreateWorksheetController>(
                    builder: (controller) => Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CreateWeorksheetTitle(
                                    text:  'اختر الفصل الدراسي'
                                  ),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: controller.semesters.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return ClassBox(
                                          width: 310,
                                          text:
                                              controller.semesters[index].name,
                                          bordercolor: controller.semester ==
                                                  controller.semesters[index].id
                                              ? AppColors.secondary
                                              : AppColors.grey,
                                          onPressed: () => {
                                            controller.setSemester(
                                                controller.semesters[index].id)
                                          },
                                        );
                                      }),
                                ],
                              ),
                              ButtonForm(
                                  text: "متابعة",
                                  color: controller.semester != 0
                                      ? AppColors.secondary
                                      : AppColors.grey,
                                  onPressed: () => {
                                        controller.semester != 0
                                            ? controller.getClasses()
                                            : null
                                      }),
                            ])))));
  }
}
