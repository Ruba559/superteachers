import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constants/app_color.dart';
import '../../Controllers/HomeController.dart';
import '../Widgets/button_form.dart';
import '../Widgets/class_box.dart';
import '../Widgets/layouts/appbar_create_worksheet.dart';

class SemestersScreen extends StatelessWidget {
  const SemestersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return Scaffold(
        appBar: AppAppBarCreateWorksheet(
             onPressed: () => {
            controller.getClasses()
          },
        ),
        drawer: Drawer(),
        //  bottomNavigationBar: AppButtomNavBar(),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              Container(
                  height: 520,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ClassBox(
                          width: 310,
                          text: 'الفصل الدراسي الأول',
                          onPressed: () => {controller.getSemesters},
                        ),
                        ClassBox(
                          width: 310,
                          text: 'الفصل الدراسي الثاني',
                          onPressed: () => {},
                        ),
                        ClassBox(
                          width: 310,
                          text: 'الفصل الدراسي الثالث',
                          onPressed: () => {},
                        ),
                        ClassBox(
                          width: 310,
                          text: 'الصف الرابع',
                          onPressed: () => {},
                        ),
                      ],
                    ),
                  )),
              ButtonForm(
                  text: "متابعة",
                  color: AppColors.secondary,
                  onPressed: () => {controller.getSemesters()}),
            ])));
  }
}
