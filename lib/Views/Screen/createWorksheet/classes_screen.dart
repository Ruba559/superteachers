import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/app_color.dart';
import '../../../Controllers/CreateWorksheetController.dart';
import '../../Widgets/button_form.dart';
import '../../Widgets/class_box.dart';
import '../../Widgets/create_worksheet_title.dart';
import '../../Widgets/layouts/appbar_create_worksheet.dart';
import '../../Widgets/layouts/appdrawar.dart';
import '../shimmer/class_shimmer.dart';

class ClassesScreen extends StatelessWidget {
   ClassesScreen({super.key});
 CreateWorksheetController controller = Get.find();
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
            appBar: AppAppBarCreateWorksheet(
              text: "create_worksheet".tr,
              onPressed: () => {controller.getSemesters()},
            ),
            drawer: AppDrawer(),
            //  bottomNavigationBar: AppButtomNavBar(),
            body: Container(
                padding: const EdgeInsets.all(20),
                child: GetBuilder(
                                init: controller,
                                builder: (_) =>   Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CreateWeorksheetTitle(text: "select_class".tr),
                           
                                   Expanded(
                                      child: controller.isLoading.value 
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
                                    )),
                            
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
                        ))));
  }
}
