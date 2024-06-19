import 'package:flutter/material.dart';
import 'package:superteachers/Constants/app_style.dart';

import '../../Constants/app_color.dart';
import '../../Constants/app_text_style.dart';

class ClassBox extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
    final double width;
    final Color bordercolor;
  const ClassBox({super.key, required this.text, this.onPressed, required this.width,  required this.bordercolor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Container(
            width: width,
             
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: bordercolor, width: bordercolor == AppColors.secondary ? 2 :1),
              borderRadius: radius30,

              
            ),
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child:
                 Text(
                  text,
                  style: AppTextStyle.medium
                      .copyWith(color: AppColors.black, height: 1.5),
                  textAlign: TextAlign.center,
                ),
             ));
  }
}
