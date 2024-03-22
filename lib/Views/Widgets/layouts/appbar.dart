import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superteachers/Constants/app_text_style.dart';

import '../../../Constants/app_color.dart';
import '../../../Constants/app_style.dart';

PreferredSize  AppAppBar (){
 
    return PreferredSize(
    preferredSize: Size(Get.width, 60),
    child: AppBar(
     
      backgroundColor: AppColors.primary,
      elevation: 1,
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25)),
      ),
      title:  Padding(
 padding: EdgeInsets.all(7),
          child: Column(
      
        children: [
        Container(  child: Text('SUPER TEACHERS', style: AppTextStyle.title),)  ,
          Text('Apply Worksheets', style: AppTextStyle.medium)
        ],
      )),
      actions: [
        Container(
          margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.secondary, width: 1),
              borderRadius: radius50,
            ),
            
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.asset(
                'assets/images/placeholder/user.png',
                height: 40.0,
                width: 40.0,
               fit: BoxFit.contain,
              ),
            ))
      ],
    ));
  
}
