import 'package:flutter/material.dart';
import 'package:superteachers/Constants/app_style.dart';

import '../../Constants/app_color.dart';
import '../../Constants/app_text_style.dart';

class SubjectBox extends StatelessWidget {
  final String text;
  final String image;
  final void Function()? onPressed;
  final Color bordercolor;
  const SubjectBox(
      {super.key,
      required this.text,
      this.onPressed,
      required this.bordercolor,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Container(
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: bordercolor, width: bordercolor == AppColors.secondary ? 2 :1),
                    borderRadius: radius30,
                  ),
                  child: Column(
                    children: [
                      Image.network(
                        image,
                        height: 100,
                        width: 100,
                        fit: BoxFit.contain,
                      ),
                    ],
                  )),
              Text(text,
                  style: AppTextStyle.body.copyWith(
                    color: AppColors.black,
                  )),
            ],
          ),
        ));
  }
}
