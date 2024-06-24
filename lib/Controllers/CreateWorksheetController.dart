import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superteachers/DataAccesslayer/Models/user_file.dart';
import 'package:superteachers/main.dart';

import '../Constants/routes.dart';
import '../DataAccesslayer/Models/class.dart';
import '../DataAccesslayer/Models/semester.dart';
import '../DataAccesslayer/Models/subject.dart';
import '../DataAccesslayer/Models/worksheet.dart';
import '../DataAccesslayer/Repository/ClassRepo.dart';
import '../DataAccesslayer/Repository/SubjectRepo.dart';
import '../DataAccesslayer/Repository/WorksheetRepo.dart';

class CreateWorksheetController extends GetxController {
  var semester = 0;
  int classe = 0;
  int subject = 0;
  int worksheet = 0;

  late TextEditingController search;
  late TextEditingController title;

  ClassRepo classRepo = ClassRepo();
  SubjectRepo subjectRepo = SubjectRepo();
  WorksheetRepo worksheetRepo = WorksheetRepo();

  List<Class> classes = [];
  List<Subject> subjects = [];
  List<Worksheet> worksheets = [];
  List<Worksheet> worksheetsMain = [];
  List<Semester> semesters = [];
  List<UserFile> worksheetsByUser = [];

  UserFile? choose;
  UserFile? userFile;

  var isLoading = false.obs;

  FilePickerResult? logo;

  Future<void> onInit() async {
    search = TextEditingController();
    title = TextEditingController();
    isLoading.value = true;
    semesters = await classRepo.getSemesters();
    isLoading.value = false;

    update();
    print('init');
    super.onInit();
  }

  @override
  void onClose() {
    print('close');
    semester = 0;
    classe = 0;
    subject = 0;
    worksheet = 0;
    super.onClose();
  }

  getClasses() async {
    isLoading.value = true;
    classes = await classRepo.getClasses();

    isLoading.value = false;
    Get.toNamed(AppRoute.classes);
  }

  getSemesters() async {
    isLoading.value = true;
    semesters = await classRepo.getSemesters();
    isLoading.value = false;
    Get.toNamed(AppRoute.semesters);
  }

  setSemester(value) {
    semester = value;
    print(value);
    update();
  }

  setClasse(value) {
    classe = value;
    update();
  }

  setSubject(value) {
    subject = value;
    update();
  }

  setWorksheet(value) {
    worksheet = value;
    update();
  }

  getSubjects() async {
    isLoading.value = true;
    subjects = await subjectRepo.getSubjects();
    isLoading.value = false;
    Get.toNamed(AppRoute.subjects);
  }

  getWorksheets() async {
    isLoading.value = true;
    worksheetsMain = await worksheetRepo.getWorksheet(
        semester.toString(), classe.toString(), subject.toString());
    worksheets = worksheetsMain;
    search.text = '';
    Get.toNamed(AppRoute.worksheets);
    isLoading.value = false;
  }

  getInfoWorksheet() async {
    isLoading.value = true;
    worksheetsByUser =
        await worksheetRepo.getWorksheetsByUser(MyApp.user?.id, worksheet);

    choose = null;
    isLoading.value = false;
    Get.toNamed(AppRoute.infoWorksheet);
  }

  onDropDownItemSelected(newSelectedBank) async {
    choose = newSelectedBank;
    title.text = choose!.title;
    print(choose);
    update();
  }

  createWorksheet() async {
    isLoading.value = true;

    if (choose == null) {
      userFile = await worksheetRepo.createWorksheet(
          MyApp.user?.id, worksheet, title.text, logo!.files.first.path);

      if (userFile != '') {
        isLoading.value = false;
        Get.offNamed(AppRoute.worksheetCreated);
      }
    } else {
      userFile = choose;
      isLoading.value = false;
      Get.offNamed(AppRoute.worksheetCreated);
    }
  }

  filterWorksheets(value) async {
    worksheets = worksheetsMain
        .where((item) => item.title
            .trim()
            .toLowerCase()
            .contains(search.text.trim().toLowerCase()))
        .toList();

    update();
  }
}
