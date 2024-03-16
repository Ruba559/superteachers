import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constants/routes.dart';
import '../Services/serviceVar.dart';

class AuthMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  ServiceVar myServices = Get.put(ServiceVar());

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("onboarding") == "1") {
      return const RouteSettings(name: AppRoute.home);
    }
    return null;
  }
}
