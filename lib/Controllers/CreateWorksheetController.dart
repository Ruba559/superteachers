import 'dart:convert';

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

  Future<void> onInit() async {
       search = TextEditingController();
    semesters = await classRepo.getSemesters();
    update();
    print(semesters);
    super.onInit();
  }

  void dispose() {
    super.dispose();
  }

  getClasses() async {
    classes = await classRepo.getClasses();
    Get.toNamed(AppRoute.classes);
  }

  getSemesters() async {
    semesters = await classRepo.getSemesters();
    print(semesters);
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
    Get.toNamed(AppRoute.home);
  }

  getSubjects() async {
    subjects = await subjectRepo.getSubjects();
    Get.toNamed(AppRoute.subjects);
  }

  getWorksheets() async {
    worksheets = await worksheetRepo.getWorksheet();
    Get.toNamed(AppRoute.worksheets);
  }

  getInfoWorksheet() {
    Get.toNamed(AppRoute.infoWorksheet);
  }
}
