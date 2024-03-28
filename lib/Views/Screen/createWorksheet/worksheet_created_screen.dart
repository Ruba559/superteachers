import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superteachers/Constants/app_color.dart';
import 'package:superteachers/Constants/app_style.dart';
import 'package:superteachers/Constants/app_text_style.dart';
import '../../../Controllers/CreateWorksheetController.dart';
import '../../Widgets/layouts/appbar_create_worksheet.dart';
import '../../Widgets/layouts/appdrawar.dart';

class WorksheetCreatedScreen extends StatelessWidget {
  const WorksheetCreatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CreateWorksheetController controller = Get.find();
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppAppBarCreateWorksheet(
              onPressed: () => {controller.getInfoWorksheet()},
            ),
            drawer: AppDrawer(),
            //  bottomNavigationBar: AppButtomNavBar(),
            body: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),
                child: GetBuilder<CreateWorksheetController>(
                    builder: (controller) => Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(30),
                                decoration: BoxDecoration(
                                    color: AppColors.secondary,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(80))),
                                child: Icon(
                                  Icons.done_all,
                                  size: 100,
                                  color: AppColors.white,
                                ),
                              ),
                              Text(
                                'تم إنشاء ورقة العمل',
                                style: AppTextStyle.medium
                                    .copyWith(color: AppColors.black),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 120,
                                    child: InkWell(
                                        onTap: () {},
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: AppColors.primary2,
                                              borderRadius: radius10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(
                                                Icons.visibility,
                                                color: AppColors.white,
                                                size: 25,
                                              ),
                                              Text(
                                                "عرض",
                                                style: AppTextStyle.body
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ),
                                  Container(
                                    width: 120,
                                    child: InkWell(
                                        onTap: () {},
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: AppColors.primary,
                                              borderRadius: radius10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(
                                                Icons.upload_file,
                                                color: AppColors.white,
                                                size: 25,
                                              ),
                                              Text(
                                                "تحميل",
                                                style: AppTextStyle.body
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ),
                                ],
                              )
                            ])))));
  }
}
