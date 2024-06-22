import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superteachers/Constants/routes.dart';
import '../../../Constants/app_color.dart';
import '../../../Controllers/CreateWorksheetController.dart';
import '../../Widgets/button_form.dart';
import '../../Widgets/class_box.dart';
import '../../Widgets/create_worksheet_title.dart';
import '../../Widgets/layouts/appbar_create_worksheet.dart';
import '../../Widgets/layouts/appdrawar.dart';
import '../shimmer/semesters_shimmer.dart';

class SemestersScreen extends StatelessWidget {
  SemestersScreen({super.key});
  final CreateWorksheetController controller =
      Get.put(CreateWorksheetController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppAppBarCreateWorksheet(
          text: "create_worksheet".tr,
          onPressed: () => {Get.offAllNamed(AppRoute.home)},
        ),
        drawer: AppDrawer(),
        //  bottomNavigationBar: AppButtomNavBar(),
        body: Container(
            padding: const EdgeInsets.all(20),
            child: GetBuilder(
                init: controller,
                builder: (_) => Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CreateWeorksheetTitle(text: "select_semester".tr),

                              // ? CircularProgressIndicator(
                              //     color: AppColors.primary,
                              //     strokeWidth: 3,
                              controller.isLoading.value
                                  ? SemestersShimmer()
                                  : ListView.builder(
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
                                      })
                            ],
                          ),
                          ButtonForm(
                              text: "continue".tr,
                              color: controller.semester != 0
                                  ? AppColors.secondary
                                  : AppColors.grey,
                              onPressed: () => {
                                    controller.semester != 0
                                        ? controller.getClasses()
                                        : null
                                  }),
                        ]))));
  }
}
