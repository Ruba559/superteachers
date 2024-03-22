import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/app_color.dart';
import '../../../Constants/app_style.dart';
import '../../../Constants/app_text_style.dart';
import '../../../Controllers/CreateWorksheetController.dart';
import '../../Widgets/button_form.dart';
import '../../Widgets/class_box.dart';
import '../../Widgets/create_worksheet_title .dart';
import '../../Widgets/layouts/appbar_create_worksheet.dart';
import '../../Widgets/layouts/appdrawar.dart';
import '../../Widgets/subject_box.dart';

class SubjectsScreen extends StatelessWidget {
  const SubjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CreateWorksheetController controller = Get.find();
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppAppBarCreateWorksheet(
              onPressed: () => {controller.getClasses()},
            ),
           drawer: AppDrawer(),
            //  bottomNavigationBar: AppButtomNavBar(),
            body: Container(
                padding: const EdgeInsets.all(20),
                child: GetBuilder<CreateWorksheetController>(
                    builder: (controller) => Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             CreateWeorksheetTitle(
                                    text:  'اختر المادة'
                                  ),
                            Expanded(
                                child:
                              GridView.count(
                                crossAxisCount: 2,
                                children: List.generate(
                                    controller.subjects.length, (index) {
                                  return SubjectBox(
                                   
                                    image :  controller.subjects[index].image,
                                    text: controller.subjects[index].name,
                                    bordercolor: controller.subject ==
                                            controller.subjects[index].id
                                        ? AppColors.secondary
                                        : AppColors.grey,
                                    onPressed: () => {
                                      controller.setSubject(
                                          controller.subjects[index].id)
                                    },
                                  );
                                }),
                              ),
                                ),
                            ButtonForm(
                                text: "متابعة",
                                color: controller.subject != 0
                                    ? AppColors.secondary
                                    : AppColors.grey,
                                onPressed: () => {
                                      controller.subject != ''
                                          ? controller.getWorksheets()
                                          : null
                                    }),
                          ],
                        )))));
  }
}
