import 'package:flutter/material.dart';
import 'package:superteachers/Constants/app_style.dart';

import '../../Constants/app_color.dart';
import '../../Constants/app_text_style.dart';

class ClassBox extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
    final double width;
  const ClassBox({super.key, required this.text, this.onPressed, required this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Container(
            width: width,
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.grey, width: 1),
              borderRadius: radius30,
            ),
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: Column(
              children: [
                Text(
                  text,
                  style: AppTextStyle.medium
                      .copyWith(color: AppColors.black, height: 1.5),
                  textAlign: TextAlign.center,
                ),
              ],
            )));
  }
}
