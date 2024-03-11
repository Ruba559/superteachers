import 'package:get/get.dart';

import '../Views/Screen/auth/login_screen.dart';
import '../Views/Screen/auth/register_screen.dart';
import '../Views/Screen/onboarding.dart';
import 'routes.dart';

List<GetPage<dynamic>> getPages = [
  GetPage(name: AppRoute.onboarding, page: () => OnboardingScreen()),
  GetPage(name: AppRoute.login, page: () => LoginScreen()),
    GetPage(name: AppRoute.register, page: () => RegisterScreen()),
];
