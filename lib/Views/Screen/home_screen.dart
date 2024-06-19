import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superteachers/Constants/routes.dart';

import '../../Controllers/HomeController.dart';
import '../Widgets/choices_box.dart';
import '../Widgets/layouts/app-buttom-navbar.dart';
import '../Widgets/layouts/appbar.dart';
import '../Widgets/layouts/appdrawar.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
  
    return SafeArea(
      child: Directionality(
        textDirection: Get.locale==Locale('ar') ?  TextDirection.rtl : TextDirection.ltr,
        child: Scaffold(
            appBar: AppAppBar(),
            drawer: AppDrawer(),
            bottomNavigationBar: AppButtomNavBar(
              selectedIndex: 0,
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ChoicesBox(
                          text: "create_worksheet".tr,
                          image: 'assets/images/worksheet.png',
                          onPressed: () => controller.getSemesters(),
                        ),
                        ChoicesBox(
                          text: "create_certificate".tr,
                          image: 'assets/images/certificate.png',
                          onPressed: () => Get.toNamed(AppRoute.createCertificate),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ChoicesBox(
                          text: "school_schedule".tr,
                          image: 'assets/images/class-table.png',
                        ),
                        ChoicesBox(
                          text: "educational_subjects".tr,
                          image: 'assets/images/book.png',
                          onPressed: () => controller.getClasses(),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ChoicesBox(
                          text: "profile".tr,
                          image: 'assets/images/profile.png',
                            onPressed: () => Get.toNamed(AppRoute.profile),
                        ),
                        ChoicesBox(
                          text: "files".tr,
                          image: 'assets/images/files.png',
                          onPressed: () => controller.getFiles()
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
