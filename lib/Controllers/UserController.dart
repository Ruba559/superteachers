import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Constants/routes.dart';
import '../DataAccesslayer/Clients/BoxStorage.dart';
import '../DataAccesslayer/Models/user.dart';
import '../main.dart';

class UserController extends GetxController {
  final BoxStorage boxClient = BoxStorage();

  final box = GetStorage();
  User? user;
  bool authed = false;
  @override
  void onInit() async {
    super.onInit();
    authed = await boxClient.getAuthState();
    if (authed) {
      MyApp.user = await boxClient.getAuthedUser();
    }
    print(MyApp.user!.image);
  }

  Future<void> saveAuthState(User user) async {
    await boxClient.setUser(user);
    MyApp.user = user;
    update();
  }

  Future<void> logout() async {
    await boxClient.removeUser();
    MyApp.user = null;
    Get.toNamed(AppRoute.login);
  }
}
