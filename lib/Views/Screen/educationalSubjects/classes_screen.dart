import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superteachers/Constants/routes.dart';
import '../../../Constants/app_color.dart';
import '../../../Controllers/EduSubjectsController.dart';
import '../../Widgets/button_form.dart';
import '../../Widgets/class_box.dart';
import '../../Widgets/create_worksheet_title.dart';
import '../../Widgets/layouts/appbar_create_worksheet.dart';
import '../../Widgets/layouts/appdrawar.dart';
import '../shimmer/class_shimmer.dart';

class ClassesEduScreen extends StatelessWidget {
   ClassesEduScreen({super.key});
  final EduSubjectsController controller = Get.put(EduSubjectsController());
  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
            appBar: AppAppBarCreateWorksheet(
              text: "educational_subjects".tr,
              onPressed: () => {Get.offAllNamed(AppRoute.home)},
            ),
            drawer: AppDrawer(),
            //  bottomNavigationBar: AppButtomNavBar(),
            body: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CreateWeorksheetTitle(text: "select_class".tr),
                           
                                   Expanded(
                                      child:  GetBuilder(
                                init: controller,
                                builder: (_) =>  controller.isLoading.value 
                                          ? ClassShimmer() : GridView.count(
                                      crossAxisCount: 2,
                                      children: List.generate(
                                          controller.classes.length, (index) {
                                        return ClassBox(
                                          width: 145,
                                          text: controller.classes[index].name,
                                          bordercolor: controller.classe ==
                                                  controller.classes[index].id
                                              ? AppColors.secondary
                                              : AppColors.grey,
                                          onPressed: () => {
                                            controller.setClasse(
                                                controller.classes[index].id)
                                          },
                                        );
                                      }),
                                    ))),
                            
                            ButtonForm(
                                text: "continue".tr,
                                color: controller.classe != 0
                                    ? AppColors.secondary
                                    : AppColors.grey,
                                onPressed: () => {
                                      controller.classe != ''
                                          ? controller.getSubjects()
                                          : null
                                    }),
                          ],
                        )));
  }
}
