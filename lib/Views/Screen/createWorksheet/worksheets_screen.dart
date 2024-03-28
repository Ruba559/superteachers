import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superteachers/Views/Widgets/input_form.dart';
import '../../../Constants/app_color.dart';
import '../../../Constants/app_style.dart';
import '../../../Constants/app_text_style.dart';
import '../../../Controllers/CreateWorksheetController.dart';
import '../../../Functions/valid_input.dart';
import '../../Widgets/button_form.dart';
import '../../Widgets/class_box.dart';
import '../../Widgets/create_worksheet_title.dart';
import '../../Widgets/layouts/appbar_create_worksheet.dart';
import '../../Widgets/layouts/appdrawar.dart';
import '../../Widgets/subject_box.dart';

class WorksheetsScreen extends StatelessWidget {
  const WorksheetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CreateWorksheetController controller = Get.find();
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppAppBarCreateWorksheet(
              onPressed: () => {controller.getSubjects()},
            ),
            drawer: AppDrawer(),
            resizeToAvoidBottomInset: false,
            //  bottomNavigationBar: AppButtomNavBar(),
            body: Container(
                padding: const EdgeInsets.all(20),
                child: GetBuilder<CreateWorksheetController>(
                    builder: (controller) => Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CreateWeorksheetTitle(text: 'اختر ورقة العمل'),
                            InputForm(
                              valid: (val) {
                                return validInput(val!, 3, 20, "text", null);
                              },
                              mycontroller: controller.search,
                              hinttext: 'بحث بواسطة عنوان ورقة العمل',
                            ),
                           Obx(() {
                                return controller.isLoading.value
                                    ? CircularProgressIndicator(
                                        color: AppColors.primary,
                                        strokeWidth: 3,
                                      )
                                    : Flexible(
                              child:  GridView.count(
                                        crossAxisCount: 2,
                                        children: List.generate(
                                            controller.worksheets.length,
                                            (index) {
                                          return InkWell(
                                            onTap: () => {
                                              controller.setWorksheet(controller
                                                  .worksheets[index].id)
                                            },
                                            onLongPress: () => {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return new AlertDialog(
                                                      title: Text(
                                                          controller
                                                              .worksheets[index]
                                                              .title,
                                                          style: AppTextStyle
                                                              .medium
                                                              .copyWith(
                                                            color:
                                                                AppColors.black,
                                                          )),
                                                      content: Image.network(
                                                        controller
                                                            .worksheets[index]
                                                            .image,
                                                        height: 310,
                                                        width: 260,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    );
                                                  })
                                            },
                                            child:
                                                //   Column(children: [
                                                Container(
                                              // padding: const EdgeInsets.all(8),

                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                border: Border.all(
                                                    color: controller
                                                                .worksheet ==
                                                            controller
                                                                .worksheets[
                                                                    index]
                                                                .id
                                                        ? AppColors.secondary
                                                        : AppColors.grey,
                                                    width:
                                                        controller.worksheet ==
                                                                controller
                                                                    .worksheets[
                                                                        index]
                                                                    .id
                                                            ? 2
                                                            : 1),
                                                borderRadius: radius10,
                                              ),
                                              child: Image.network(
                                                controller
                                                    .worksheets[index].image,
                                                // height: 180,
                                                //  width: 150,
                                                //  fit: BoxFit.contain,
                                              ),
                                            ),
                                            // Text(controller.worksheets[index].title,
                                            //     style: AppTextStyle.body.copyWith(
                                            //       color: AppColors.black,
                                            //     )),
                                            //  ]),
                                          );
                                        }),
                                      ),
                             
                            );
                             }),
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
                          ],
                        )))));
  }
}
