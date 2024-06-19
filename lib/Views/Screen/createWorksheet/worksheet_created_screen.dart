import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superteachers/Constants/app_color.dart';
import 'package:superteachers/Constants/app_style.dart';
import 'package:superteachers/Constants/app_text_style.dart';
import '../../../Controllers/CreateWorksheetController.dart';
import '../../Widgets/layouts/appbar_create_worksheet.dart';
import '../../Widgets/layouts/appdrawar.dart';
import 'package:url_launcher/url_launcher.dart';

class WorksheetCreatedScreen extends StatelessWidget {
  const WorksheetCreatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CreateWorksheetController controller = Get.find();
    return Scaffold(
        appBar: AppAppBarCreateWorksheet(
            text: "create_worksheet".tr,
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
                            "worksheet_created".tr,
                            style: AppTextStyle.medium
                                .copyWith(color: AppColors.black),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 120,
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
                                      InkWell(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return new AlertDialog(
                                                  content: Image.network(
                                                    controller.userFile!.logo,
                                                    height: 310,
                                                    width: 260,
                                                    fit: BoxFit.fill,
                                                  ),
                                                );
                                              });
                                        },
                                        child: Text(
                                          "show".tr,
                                          style: AppTextStyle.body.copyWith(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                  width: 120,
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
                                        InkWell(
                                          onTap: () async {
                                            
                                              print(controller.userFile!.logo);
                                               final Uri _url = Uri.parse(controller.userFile!.logo);
                                           
                                                await launchUrl(_url);
                                           
                                            // var dir =
                                            //     await getExternalStorageDirectory();
                                            // print('up');
                                            // FlutterDownloader.enqueue(
                                            //   url:
                                            //       'https://assets.website-files.com/603d0d2db8ec32ba7d44fffe/603d0e327eb2748c8ab1053f_loremipsum.pdf',
                                            //   savedDir: dir!.path,
                                            //   showNotification: true,
                                            //   saveInPublicStorage: true,
                                            //   openFileFromNotification: true,
                                            // );
                                          },
                                          child: Text(
                                            "download".tr,
                                            style: AppTextStyle.body.copyWith(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            ],
                          )
                        ]))));
  }
}
