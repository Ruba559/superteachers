import 'package:flutter/material.dart';
import 'package:superteachers/Constants/app_style.dart';

import '../../Constants/app_color.dart';
import '../../Constants/app_text_style.dart';

class ChoicesBox extends StatelessWidget {
  final String text;
  final String image;
  final void Function()? onPressed;
  const ChoicesBox(
      {super.key, required this.text, this.onPressed, required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.grey, width: 1),
              borderRadius: radius30,
            ),
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Image.asset(
                  image,
                  height: 100,
                  //   fit: BoxFit.fill,
                ),
                Text(text,
                    style: AppTextStyle.body.copyWith(
                      color: AppColors.black,
                    )),
              ],
            )));
  }
}
