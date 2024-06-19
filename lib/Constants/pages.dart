import 'package:get/get.dart';
import 'package:superteachers/Views/Screen/files_screen.dart';
import 'package:superteachers/Views/Screen/notifications_screen.dart';
import 'package:superteachers/Views/Screen/settings_screen.dart';

import '../Middlewares/AuthMiddleware.dart';
import '../Views/Screen/auth/account_created_screen.dart';
import '../Views/Screen/auth/choose_plan_screen.dart';
import '../Views/Screen/auth/login_screen.dart';
import '../Views/Screen/auth/payment_method_screen.dart';
import '../Views/Screen/auth/register_screen.dart';
import '../Views/Screen/auth/verify_code_screen.dart';
import '../Views/Screen/createCertificate/create_certificate.dart';
import '../Views/Screen/createCertificate/create_new_certificate.dart';
import '../Views/Screen/createCertificate/designs_screen.dart';
import '../Views/Screen/createCertificate/logos_screen.dart';
import '../Views/Screen/createCertificate/names_screen.dart';
import '../Views/Screen/createCertificate/preview_download_screen.dart';
import '../Views/Screen/createCertificate/set_date_sign_screen.dart';
import '../Views/Screen/createCertificate/texts_screen.dart';
import '../Views/Screen/createWorksheet/Info_worksheet_screen.dart';
import '../Views/Screen/createWorksheet/classes_screen.dart';
import '../Views/Screen/createWorksheet/semesters_screen.dart';
import '../Views/Screen/createWorksheet/subjects_screen.dart';
import '../Views/Screen/createWorksheet/worksheet_created_screen.dart';
import '../Views/Screen/createWorksheet/worksheets_screen.dart';
import '../Views/Screen/educationalSubjects/classes_screen.dart';
import '../Views/Screen/educationalSubjects/edu_subjects_files_screen.dart';
import '../Views/Screen/educationalSubjects/semesters_screen.dart';
import '../Views/Screen/educationalSubjects/subjects_screen.dart';
import '../Views/Screen/home_screen.dart';
import '../Views/Screen/onboarding.dart';
import '../Views/Screen/splash_screen.dart';
import '../Views/Screen/auth/profile_screen.dart';
import 'routes.dart';

List<GetPage<dynamic>> getPages = [
  GetPage(
      name: AppRoute.onboarding,
      page: () => const OnboardingScreen(),
     
      ),
  GetPage(
      name: AppRoute.login,
      page: () => LoginScreen(),
      transition: Transition.circularReveal),
  GetPage(
      name: AppRoute.register,
      page: () => RegisterScreen(),
      transition: Transition.leftToRight),
  GetPage(
      name: AppRoute.verifyCode,
      page: () => VerifyCodeScreen(),
      transition: Transition.rightToLeftWithFade),
  GetPage(name: AppRoute.choosePlan, page: () => ChoosePlanScreen()),
  GetPage(name: AppRoute.paymentMethod, page: () => PaymentMethodScreen()),
  GetPage(
      name: AppRoute.home,
      page: () => HomeScreen(),
      transition: Transition.circularReveal),
  GetPage(
      name: AppRoute.classes,
      page: () => ClassesScreen(),
      transition: Transition.circularReveal),
  GetPage(
      name: AppRoute.semesters,
      page: () => SemestersScreen(),
      transition: Transition.leftToRight),
  GetPage(
      name: AppRoute.subjects,
      page: () => SubjectsScreen(),
      transition: Transition.rightToLeft),
  GetPage(name: AppRoute.splashScreen, page: () => SplashScreen()),
  GetPage(name: AppRoute.worksheets, page: () => WorksheetsScreen()),
  GetPage(name: AppRoute.infoWorksheet, page: () => InfoWorksheetScreen()),
  GetPage(
      name: AppRoute.worksheetCreated, page: () => WorksheetCreatedScreen()),
  GetPage(name: AppRoute.accountCreated, page: () => AccountCreatedScreen()),
  GetPage(name: AppRoute.notifications, page: () => NotificationsScreen()),
  GetPage(name: AppRoute.files, page: () => FilesScreen()),
  GetPage(name: AppRoute.settings, page: () => SettingsScreen()),
  GetPage(name: AppRoute.profile, page: () => ProfileScreen()),
  GetPage(
      name: AppRoute.createCertificate, page: () => CreateCertificateScreen()),
  GetPage(
      name: AppRoute.newCreateCertificate,
      page: () => CreateNewCertificateScreen()),
  GetPage(name: AppRoute.logos, page: () => LogosScreen()),
  GetPage(name: AppRoute.texts, page: () => TextsScreen()),
  GetPage(name: AppRoute.names, page: () => NamesScreen()),
  GetPage(name: AppRoute.setDateSign, page: () => SetDateSignScreen()),
  GetPage(name: AppRoute.previewDownload, page: () => PreviewDownloadScreen()),
  GetPage(name: AppRoute.designs, page: () => DesignsScreen()),
  GetPage(name: AppRoute.classesEdu, page: () => ClassesEduScreen()),
  GetPage(name: AppRoute.subjectsEdu, page: () => SubjectsEduScreen()),
  GetPage(name: AppRoute.semestersEdu, page: () => SemestersEduScreen()),
  GetPage(name: AppRoute.eduSubjectsFiles, page: () => EduSubjectsFilesScreen()),
];
