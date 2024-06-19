import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'Constants/pages.dart';
import 'Controllers/LocaleController.dart';
import 'Data/Translations/lang.dart';
import 'DataAccesslayer/Models/user.dart';
import 'bindings/init_bindings.dart';


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print(message.data);
  print("Handling a background message: ${message.notification!.title}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
 
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static int bottomSelectedItem = 0;
  static User? user;
  @override
  Widget build(BuildContext context) {
    Get.put(LocaleController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      locale: Locale('ar'),
      getPages: getPages,
      translations: Lang(),
       initialBinding: InitBinding(),
    );
  }
}
