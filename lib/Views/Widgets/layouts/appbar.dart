import 'package:flutter/material.dart';
import 'package:superteachers/Constants/app_text_style.dart';

import '../../../Constants/app_color.dart';
import '../../../Constants/app_style.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  AppAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(65);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      elevation: 1,
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25)),
      ),
      title: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('SUPER TEACHERS', style: AppTextStyle.title),
          Text('Apply Worksheets', style: AppTextStyle.medium)
        ],
      )),
      actions: [
        Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.secondary, width: 1),
              borderRadius: radius50,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.asset(
                'assets/images/placeholder/user.png',
                height: 10.0,
                width: 50.0,
                fit: BoxFit.cover,
              ),
            ))
      ],
    );
  }
}
