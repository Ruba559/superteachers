import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../DataAccesslayer/Models/certificate.dart';
import '../DataAccesslayer/Models/user_certificate.dart';
import '../DataAccesslayer/Models/user_file.dart';
import '../DataAccesslayer/Repository/CertificateRepo.dart';
import '../DataAccesslayer/Repository/WorksheetRepo.dart';
import '../main.dart';

class TabsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'LEFT'),
    Tab(text: 'RIGHT'),
  ];

  late TabController controller;

  List<UserFile> worksheets = [];
  List<UserCertificate> certificates = [];

  CertificateRepo certificateRepo = CertificateRepo();
  WorksheetRepo worksheetRepo = WorksheetRepo();

  var isLoading = false.obs;
  @override
  Future<void> onInit() async {
    super.onInit();

    controller = TabController(vsync: this, length: myTabs.length);
    isLoading.value = true;
    certificates = await certificateRepo.getUserCertificate(MyApp.user!.id);
    worksheets = await worksheetRepo.getWorksheetsUser(MyApp.user!.id);
    update();
      isLoading.value = false;
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
