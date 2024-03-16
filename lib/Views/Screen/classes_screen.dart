import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constants/app_color.dart';
import '../../Controllers/HomeController.dart';
import '../Widgets/button_form.dart';
import '../Widgets/class_box.dart';
import '../Widgets/layouts/appbar_create_worksheet.dart';

class ClassesScreen extends StatelessWidget {
  const ClassesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return Scaffold(
        appBar: AppAppBarCreateWorksheet(
          onPressed: () => {controller.getHome()},
        ),
        drawer: Drawer(),
        //  bottomNavigationBar: AppButtomNavBar(),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  height: 520,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ClassBox(
                              width: 140,
                              text: 'الصف الاول',
                              onPressed: () => {controller.getSemesters()},
                            ),
                            ClassBox(
                              width: 140,
                              text: 'الصف الثاني',
                              onPressed: () => {},
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ClassBox(
                              width: 140,
                              text: 'الصف الثالث',
                              onPressed: () => {},
                            ),
                            ClassBox(
                              width: 140,
                              text: 'الصف الرابع',
                              onPressed: () => {},
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ClassBox(
                              width: 140,
                              text: 'الصف الخامس',
                              onPressed: () => {},
                            ),
                            ClassBox(
                              width: 140,
                              text: 'الصف السادس',
                              onPressed: () => {},
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ClassBox(
                              width: 140,
                              text: 'الصف الاول',
                              onPressed: () => {},
                            ),
                            ClassBox(
                              width: 140,
                              text: 'الصف الاول',
                              onPressed: () => {},
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ClassBox(
                              width: 140,
                              text: 'الصف الاول',
                              onPressed: () => {},
                            ),
                            ClassBox(
                              width: 140,
                              text: 'الصف الاول',
                              onPressed: () => {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ButtonForm(
                    text: "متابعة",
                    color: AppColors.secondary,
                    onPressed: () => {controller.getSemesters()}),
              ],
            )));
  }
}
