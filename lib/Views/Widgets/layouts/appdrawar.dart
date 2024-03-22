import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superteachers/Constants/app_text_style.dart';

import '../../../Constants/app_color.dart';
import '../../../Controllers/LoginController.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    
    return GetBuilder<LoginController>(
        builder: (controller) =>  Drawer(
      backgroundColor: AppColors.white,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.primary,
            ),
               accountName: Text('ruba'),
            accountEmail: Text('ruba@gmail.com'),
            currentAccountPicture: 
           CircleAvatar(
              backgroundImage: AssetImage('assets/images/placeholder/user.png')),
            
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
     ));
  }
}


