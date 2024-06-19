import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/app_color.dart';
import '../../../Constants/app_style.dart';
import '../../../Constants/app_text_style.dart';
import '../../../Controllers/CreateWorksheetController.dart';
import '../../Widgets/button_form.dart';
import '../../Widgets/class_box.dart';
import '../../Widgets/create_worksheet_title.dart';
import '../../Widgets/layouts/appbar_create_worksheet.dart';
import '../../Widgets/layouts/appdrawar.dart';
import '../../Widgets/subject_box.dart';
import '../shimmer/subject_shimmer.dart';

class SubjectsScreen extends StatelessWidget {
  const SubjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CreateWorksheetController controller = Get.find();
    return  Scaffold(
            appBar: AppAppBarCreateWorksheet(
                text: "create_worksheet".tr,
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
                            CreateWeorksheetTitle(text: "select_subject".tr),
                   
                                      Expanded(
                              child:  GetBuilder(
                                init: controller,
                                builder: (_) =>  controller.isLoading.value 
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
                              
                            )),
                            
                            ButtonForm(
                               text: "continue".tr,
                                color: controller.subject != 0
                                    ? AppColors.secondary
                                    : AppColors.grey,
                                onPressed: () => {
                                      controller.subject != ''
                                          ? controller.getWorksheets()
                                          : null
                                    }),
                          ],
                        ))));
  }
}
