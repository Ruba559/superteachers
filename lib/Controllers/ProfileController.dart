import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../DataAccesslayer/Clients/BoxStorage.dart';
import '../DataAccesslayer/Models/user.dart';
import '../DataAccesslayer/Repository/UserRepo.dart';
import '../Views/Widgets/snackbar.dart';
import '../main.dart';

class ProfileController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController? password = TextEditingController();

  File? image;

  UserRepo userRepo = UserRepo();
  User? user;

  var isLoading = false.obs;

  final BoxStorage boxClient = BoxStorage();

  selectImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (file != null) {
      image = File(file.path);
      update();
      print(image);
    }
  }

  void onInit() {
    setUserDetails(MyApp.user);

    super.onInit();
  }

  void setUserDetails(User? user) {
    if (user != null) {
      name.value = TextEditingValue(text: user.name);
      email.value = TextEditingValue(text: user.email);
    }
  }

  Future<void> updateProfile() async {
    if (name.text != '' && email.text != '') {
      isLoading.value = true;

      user = await userRepo.updateProfile(MyApp.user?.id, name.text, email.text,
          password!.text, image != null ? image!.path : null);

      if (user != '') {
        isLoading.value = false;
        MyApp.user = user;
        await boxClient.setUser(user!);
        update();
        SnackBars.showSuccess('profile_updated'.tr);
      }
    }
  }
}
