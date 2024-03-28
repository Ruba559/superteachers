import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  ClassRepo classRepo = ClassRepo();
  SubjectRepo subjectRepo = SubjectRepo();
  WorksheetRepo worksheetRepo = WorksheetRepo();

  List<Class> classes = [];
  List<Subject> subjects = [];
  List<Worksheet> worksheets = [];
  List<Semester> semesters = [];
  List<Worksheet> worksheetsByUser = [];

   Worksheet? choose ;

  var isLoading = false.obs;

   FilePickerResult? result;

  Future<void> onInit() async {
    search = TextEditingController();
     isLoading.value = true;
    semesters = await classRepo.getSemesters();
    isLoading.value = false;
    update();

    super.onInit();
  }

  void dispose() {
    super.dispose();
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

  getHome() {
    semester = 0;
    classe = 0;
    subject = 0;
    worksheet = 0;
    Get.toNamed(AppRoute.home);
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
    
    worksheetsByUser = await worksheetRepo.getWorksheetsByUser();
    print(worksheetsByUser);
    isLoading.value = false;
    Get.toNamed(AppRoute.infoWorksheet);
  }

  onDropDownItemSelected(newSelectedBank) async {
    choose = newSelectedBank;

    update();
  }

  createWorksheet() {
    Get.toNamed(AppRoute.worksheetCreated);
  }
}
