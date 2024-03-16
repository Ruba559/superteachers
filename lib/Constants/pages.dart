import 'package:get/get.dart';

import '../Middlewares/AuthMiddleware.dart';
import '../Views/Screen/auth/choose_plan_screen.dart';
import '../Views/Screen/auth/login_screen.dart';
import '../Views/Screen/auth/payment_method_screen.dart';
import '../Views/Screen/auth/register_screen.dart';
import '../Views/Screen/auth/verify_code_screen.dart';
import '../Views/Screen/classes_screen.dart';
import '../Views/Screen/home_screen.dart';
import '../Views/Screen/onboarding.dart';
import '../Views/Screen/semesters_screen.dart';
import 'routes.dart';

List<GetPage<dynamic>> getPages = [
  GetPage(
      name: AppRoute.onboarding,
      page: () => const OnboardingScreen(),
      middlewares: [AuthMiddleWare()]),
  GetPage(name: AppRoute.login, page: () => LoginScreen()),
  GetPage(name: AppRoute.register, page: () => RegisterScreen()),
  GetPage(name: AppRoute.verifyCode, page: () => VerifyCodeScreen()),
  GetPage(name: AppRoute.choosePlan, page: () => ChoosePlanScreen()),
  GetPage(name: AppRoute.paymentMethod, page: () => PaymentMethodScreen()),
  GetPage(name: AppRoute.home, page: () => HomeScreen()),
  GetPage(name: AppRoute.classes, page: () => ClassesScreen()),
  GetPage(name: AppRoute.semesters, page: () => SemestersScreen()),
];
