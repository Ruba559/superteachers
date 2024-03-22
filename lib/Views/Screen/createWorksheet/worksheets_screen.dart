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
import '../../Widgets/create_worksheet_title .dart';
import '../../Widgets/layouts/appbar_create_worksheet.dart';
import '../../Widgets/layouts/appdrawar.dart';
import '../../Widgets/subject_box.dart';

class WorksheetsScreen extends StatelessWidget {
  const WorksheetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CreateWorksheetController controller = Get.find();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppAppBarCreateWorksheet(
              onPressed: () => {controller.getSubjects()},
            ),
            drawer: AppDrawer(),
            //  bottomNavigationBar: AppButtomNavBar(),
            body:  Container(
                padding: const EdgeInsets.all(20),
                child:   GetBuilder<CreateWorksheetController>(
                    builder: (controller) =>  Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CreateWeorksheetTitle(text: 'اختر ورقة العمل'),
                            InputForm(
                              valid: (val) {
                                return validInput(val!, 3, 20, "password");
                              },
                              mycontroller: controller.search,
                              hinttext: 'بحث بواسطة عنوان ورقة العمل',
                            ),
                            
                       GridView.builder(
                                shrinkWrap: true,
                                itemCount: controller.worksheets.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  //  childAspectRatio: 100
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                      onTap: () => controller.setWorksheet(
                                          controller.worksheets[index].id),
                                      child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: controller.worksheet ==
                                                        controller
                                                            .worksheets[index]
                                                            .id
                                                    ? AppColors.secondary
                                                    : AppColors.grey,
                                                width: controller.worksheet ==
                                                        controller
                                                            .worksheets[index]
                                                            .id
                                                    ? 2
                                                    : 1),
                                          ),
                                          child: ClipRRect(
                                              child: Image.network(
                                            controller.worksheets[index].image,
                                            height: 600,
                                            width: 600,
                                            fit: BoxFit.contain,
                                          ))));
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
                        )))) 
                        
                        );
  }
}
