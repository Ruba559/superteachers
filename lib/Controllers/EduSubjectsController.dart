import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superteachers/DataAccesslayer/Repository/EducationalSubjectRepo.dart';

import '../Constants/routes.dart';
import '../DataAccesslayer/Models/class.dart';
import '../DataAccesslayer/Models/educational_subject.dart';
import '../DataAccesslayer/Models/semester.dart';
import '../DataAccesslayer/Models/subject.dart';
import '../DataAccesslayer/Repository/ClassRepo.dart';
import '../DataAccesslayer/Repository/SubjectRepo.dart';

class EduSubjectsController extends GetxController {
  var semester = 0;
  int classe = 0;
  int subject = 0;

  ClassRepo classRepo = ClassRepo();
  SubjectRepo subjectRepo = SubjectRepo();

  EducationalSubjectRepo educationalSubjectRepo = EducationalSubjectRepo();

  List<Class> classes = [];
  List<Subject> subjects = [];
  List<Semester> semesters = [];
  List<EducationalSubject> educationalSubjects = [];

  var isLoading = false.obs;

  Future<void> onInit() async {
    isLoading.value = true;
    classes = await classRepo.getClasses();
    isLoading.value = false;

    update();

    super.onInit();
  }

  getClasses() async {
    isLoading.value = true;
    classes = await classRepo.getClasses();

    isLoading.value = false;
    Get.toNamed(AppRoute.classesEdu);
  }

  getSemesters() async {
    isLoading.value = true;
    semesters = await classRepo.getSemesters();
    isLoading.value = false;
    Get.toNamed(AppRoute.semestersEdu);
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



  getSubjects() async {
    isLoading.value = true;
    subjects = await subjectRepo.getSubjects();
    isLoading.value = false;
    Get.toNamed(AppRoute.subjectsEdu);
  }

  getEduSubjectsFiles() async {
     isLoading.value = true;
    educationalSubjects = await educationalSubjectRepo.getEducationalSubjects(
        subject, semester, classe);
         isLoading.value = false;
    Get.toNamed(AppRoute.eduSubjectsFiles);
  }
}
