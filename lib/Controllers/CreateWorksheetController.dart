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

    super.onInit();
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
    worksheets = await worksheetRepo.getWorksheet(
        semester.toString(), classe.toString(), subject.toString());

    Get.toNamed(AppRoute.worksheets);
    isLoading.value = false;
  }

  getInfoWorksheet() async {
    isLoading.value = true;
    print('hi');
    worksheetsByUser =
        await worksheetRepo.getWorksheetsByUser(MyApp.user?.id, worksheet);

    choose = null;
    isLoading.value = false;
    Get.toNamed(AppRoute.infoWorksheet);
  }

  onDropDownItemSelected(newSelectedBank) async {
    print('hi');
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
}
