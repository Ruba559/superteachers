import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/app_color.dart';
import '../../../Controllers/CreateWorksheetController.dart';
import '../../Widgets/button_form.dart';
import '../../Widgets/class_box.dart';
import '../../Widgets/create_worksheet_title.dart';
import '../../Widgets/layouts/appbar_create_worksheet.dart';
import '../../Widgets/layouts/appdrawar.dart';

class ClassesScreen extends StatelessWidget {
  const ClassesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CreateWorksheetController controller = Get.find();
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppAppBarCreateWorksheet(
              onPressed: () => {controller.getSemesters()},
            ),
            drawer: AppDrawer(),
            //  bottomNavigationBar: AppButtomNavBar(),
            body: Container(
                padding: const EdgeInsets.all(20),
                child: GetBuilder<CreateWorksheetController>(
                    builder: (controller) => Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CreateWeorksheetTitle(text: 'اختر الصف'),
                            Obx(() {
                              return controller.isLoading.value
                                  ? CircularProgressIndicator(
                                      color: AppColors.primary,
                                      strokeWidth: 3,
                                    )
                                  : Expanded(
                                      child: GridView.count(
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
                                    ));
                            }),
                            ButtonForm(
                                text: "متابعة",
                                color: controller.classe != 0
                                    ? AppColors.secondary
                                    : AppColors.grey,
                                onPressed: () => {
                                      controller.classe != ''
                                          ? controller.getSubjects()
                                          : null
                                    }),
                          ],
                        )))));
  }
}
