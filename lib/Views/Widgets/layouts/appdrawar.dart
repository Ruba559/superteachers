import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superteachers/Constants/app_text_style.dart';
import 'package:superteachers/Controllers/HomeController.dart';
import 'package:superteachers/main.dart';

import '../../../Constants/app_color.dart';
import '../../../Controllers/LoginController.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return   Drawer(
      backgroundColor: AppColors.white,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.primary,
            ),
               accountName: Text(MyApp.user != null ? MyApp.user!.name : ''),
            accountEmail: Text(MyApp.user != null ? MyApp.user!.email : ''),
            currentAccountPicture: 
            MyApp.user != null ?
           CircleAvatar(
              backgroundImage:  NetworkImage(MyApp.user!.image )):CircleAvatar(
              backgroundImage:  AssetImage('assets/images/logo.png' )) ,
            
      ),
        ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.black,
            ),
            title: Text(
              "Logout",
              style: AppTextStyle.body.copyWith(color: AppColors.black),
            ),
            onTap: () {
                controller.logout();
            },
          ),
      ]
      
      )
     );
  }
}


