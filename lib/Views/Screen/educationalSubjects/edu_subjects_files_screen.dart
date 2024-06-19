import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superteachers/Controllers/EduSubjectsController.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Constants/app_color.dart';
import '../../../Constants/app_style.dart';
import '../../Widgets/create_worksheet_title.dart';
import '../../Widgets/layouts/appbar_create_worksheet.dart';
import '../../Widgets/layouts/appdrawar.dart';
import '../shimmer/semesters_shimmer.dart';

class EduSubjectsFilesScreen extends StatelessWidget {
  EduSubjectsFilesScreen({super.key});
  final EduSubjectsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppAppBarCreateWorksheet(
          text: "educational_subjects".tr,
          onPressed: () => {controller.getSemesters()},
        ),
        drawer: AppDrawer(),
        //  bottomNavigationBar: AppButtomNavBar(),
        body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CreateWeorksheetTitle(text: "educational_subjects_download".tr),
                GetBuilder(
                    init: controller,
                    builder: (_) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.educationalSubjects.length,
                          itemBuilder: (BuildContext context, int index) {
                            return controller.isLoading.value
                                ? SemestersShimmer()
                                : Container(
                                    decoration: BoxDecoration(
                                      borderRadius: radius20,
                                      color: AppColors.white,
                                      border: Border.all(
                                          color: AppColors.grey, width: 0.5),
                                    ),
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    padding: const EdgeInsets.all(6),
                                    child: InkWell(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius: radius20,
                                                    color: AppColors.white),
                                                child: ClipRRect(
                                                  borderRadius: radius20,
                                                  child: Image.network(
                                                    controller
                                                        .educationalSubjects[
                                                            index]
                                                        .file,
                                                    height: 80,
                                                    width: 80,
                                                    fit: BoxFit.contain,
                                                  ),
                                                )),
                                          ),
                                          Expanded(
                                            flex: 5,
                                            child: Text(
                                              controller
                                                  .educationalSubjects[index]
                                                  .name,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: InkWell(
                                                onTap: () async {
                                                  print(controller
                                                      .educationalSubjects[
                                                          index]
                                                      .file);
                                                  final Uri _url = Uri.parse(
                                                      controller
                                                          .educationalSubjects[
                                                              index]
                                                          .file);

                                                  await launchUrl(_url);
                                                },
                                                child: Icon(
                                                  Icons.download,
                                                  color: AppColors.primary,
                                                )),
                                          )
                                        ])));
                          });
                    })
              ],
            )));
  }
}
