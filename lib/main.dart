import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'Constants/pages.dart';
import 'DataAccesslayer/Models/user.dart';

void main() async {
 //   WidgetsFlutterBinding.ensureInitialized();
   await GetStorage.init();
   
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static int bottomSelectedItem = 0;
  static User? user ;
  @override
  Widget build(BuildContext context) {
   
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      getPages: getPages,
    );
  }
}
