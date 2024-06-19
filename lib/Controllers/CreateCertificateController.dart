import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superteachers/DataAccesslayer/Models/certificate.dart';
import 'package:superteachers/DataAccesslayer/Models/student_name.dart';
import 'package:superteachers/DataAccesslayer/Models/user_certificate.dart';
import 'package:superteachers/main.dart';

import '../Constants/routes.dart';
import '../DataAccesslayer/Clients/BoxStorageName.dart';
import '../DataAccesslayer/Models/expirydate.dart';
import '../DataAccesslayer/Models/logo.dart';
import '../DataAccesslayer/Repository/CertificateRepo.dart';
import '../DataAccesslayer/Repository/UserRepo.dart';
import '../Views/Widgets/snackbar.dart';
import 'package:intl/intl.dart';

class CreateCertificateController extends GetxController {
  var type = 'new';

  Certificate? certificateType;

  var isLoading = false.obs;

  CertificateRepo certificateRepo = CertificateRepo();

  List<Certificate> certificates = [];
  List<Logo> logos = [];

  FilePickerResult? logo_file;

  late int logo_id = 0;
  UserCertificate? userCertificate;

  GlobalKey<FormState> formstatetext = GlobalKey<FormState>();
  GlobalKey<FormState> formstatedate = GlobalKey<FormState>();
  late TextEditingController title = TextEditingController();
  late TextEditingController subtitle = TextEditingController();
  late TextEditingController body = TextEditingController();
  late TextEditingController name = TextEditingController();
  late TextEditingController sign = TextEditingController();
  late TextEditingController datePickerController = TextEditingController();

  List<StudentName> nameItems = [];

  BoxStorageName boxStorageName = BoxStorageName();

  Future<void> onInit() async {
     certificates = await certificateRepo.getCertificate();
    certificateType = certificates.first;
    super.onInit();
  }

  getNewCreateCertificate() async {
    Get.toNamed(AppRoute.newCreateCertificate);
  }

  selectCertificateType(value) async {
    certificateType = value;
    update();
  }

  setType(value) {
    type = value;
    update();
  }

  getLogos() async {
    isLoading.value = true;
    logos = await certificateRepo.getLogos(MyApp.user!.id);
    isLoading.value = false;
    Get.toNamed(AppRoute.logos);
  }

  setLogo(id) {
    logo_id = id;
    update();
    print(logo_id);
  }

  addLogo(context) async {
    if (logo_file != null) {
      isLoading.value = true;
      await certificateRepo.addLogo(
          MyApp.user?.id, logo_file!.files.first.path);
      logo_file = null;

      await getLogos();
      update();
      print(logos);
      isLoading.value = false;
      Navigator.pop(context, true);
    }
  }

  getNames() {
    if (formstatetext.currentState!.validate()) {
      print(title.text);
      Get.toNamed(AppRoute.names);
    }
  }

  addName(context) async {
    if (name.text != '') {
      var item = StudentName(
        name: name.text,
      );

      nameItems.add(item);

      await boxStorageName.addName(nameItems);

      nameItems = await boxStorageName.getNames();
      name.text = '';
      Navigator.pop(context, true);
      update();
    } else {
      Navigator.pop(context, true);
    }
  }

  deleteName(index, context) async {
    nameItems.removeAt(index);
    await boxStorageName.addName(nameItems);
    nameItems = await boxStorageName.getNames();
    Navigator.pop(context, true);
    update();
  }

  editName(value) {
    for (var index = 0; index < nameItems.length; index++) {
      if (nameItems[index].name == value) {
        name.text = nameItems[index].name;
        update();
      }
    }
  }

  updateName(index, context) async {
    nameItems.removeAt(index);
    var item = StudentName(
      name: name.text,
    );

    nameItems.add(item);
    await boxStorageName.addName(nameItems);

    nameItems = await boxStorageName.getNames();
    name.text = '';
    Navigator.pop(context, true);
    update();
  }

  late Expirydate expirydate;
  UserRepo userRepo = UserRepo();
  getPreviewDownload() async {
    if (formstatedate.currentState!.validate()) {
      expirydate = await userRepo.getExpirydate(MyApp.user!.id);

      if (expirydate.availble_days <= 0) {
        SnackBars.showWarning('تم انتهاء الاشتراك');
      } else {
        isLoading.value = true;

        userCertificate = await certificateRepo.createCertificate(
            MyApp.user?.id,
            logo_id,
            certificateType!.id,
            title.text,
            subtitle.text,
            body.text,
            datePickerController.text,
            sign.text);

        if (userCertificate != '') {
          isLoading.value = false;
          Get.toNamed(AppRoute.previewDownload);
        }
      }
    }
  }

  getDesigns() {
    Get.toNamed(AppRoute.designs);
  }

  onTapFunction({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(2015),
      initialDate: DateTime.now(),
    );
    if (pickedDate == null) return;
    datePickerController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
  }
}
