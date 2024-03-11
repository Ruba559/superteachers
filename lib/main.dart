import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Constants/pages.dart';

void main() {
  runApp(const MyApp());
 

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      getPages: getPages,
      //  home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
