import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/app_color.dart';
import '../../../Controllers/EduSubjectsController.dart';
import '../../Widgets/button_form.dart';
import '../../Widgets/create_worksheet_title.dart';
import '../../Widgets/layouts/appbar_create_worksheet.dart';
import '../../Widgets/layouts/appdrawar.dart';
import '../../Widgets/subject_box.dart';
import '../shimmer/subject_shimmer.dart';

class SubjectsEduScreen extends StatelessWidget {
   SubjectsEduScreen({super.key});
 final EduSubjectsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            appBar: AppAppBarCreateWorksheet(
                text: "educational_subjects".tr,
              onPressed: () => {controller.getClasses()},
            ),
            drawer: AppDrawer(),
            //  bottomNavigationBar: AppButtomNavBar(),
            body: Container(
                padding: const EdgeInsets.all(20),
                child:  GetBuilder(
                                init: controller,
                                builder: (_) =>  Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CreateWeorksheetTitle(text: "select_subject".tr),
                   
                                      Expanded(
                              child:   controller.isLoading.value 
                                          ? SubjectShimmer() : GridView.count(
                                        crossAxisCount: 2,
                                        children: List.generate(
                                            controller.subjects.length,
                                            (index) {
                                          return SubjectBox(
                                            image: controller
                                                .subjects[index].image,
                                            text:
                                                controller.subjects[index].name,
                                            bordercolor: controller.subject ==
                                                    controller
                                                        .subjects[index].id
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
                               text: "continue".tr,
                                color: controller.subject != 0
                                    ? AppColors.secondary
                                    : AppColors.grey,
                                onPressed: () => {
                                      controller.subject != ''
                                          ? controller.getSemesters()
                                          : null
                                    }),
                          ],
                        ))));
  }
}
