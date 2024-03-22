import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superteachers/Constants/app_style.dart';
import 'package:superteachers/Constants/app_text_style.dart';

import '../../Controllers/HomeController.dart';
import '../Widgets/choices_box.dart';
import '../Widgets/layouts/app-buttom-navbar.dart';
import '../Widgets/layouts/appbar.dart';
import '../Widgets/layouts/appdrawar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
      appBar: AppAppBar(),
      drawer: AppDrawer(),
      bottomNavigationBar: AppButtomNavBar(),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ChoicesBox(
                  text: 'إنشاء شهادة',
                  image: 'assets/images/certificate.png',
                  onPressed: () => null,
                ),
                ChoicesBox(
                  text: 'إنشاء ورقة عمل',
                  image: 'assets/images/worksheet.png',
                  onPressed: () => controller.getSemesters(),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ChoicesBox(
                  text: ' جدول الحصص',
                  image: 'assets/images/class-table.png',
                ),
                ChoicesBox(
                  text: 'المناهج الدراسية',
                  image: 'assets/images/book.png',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ChoicesBox(
                  text: 'الملف الشخصي',
                  image: 'assets/images/profile.png',
                ),
                ChoicesBox(
                  text: 'ملفاتي',
                  image: 'assets/images/files.png',
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
