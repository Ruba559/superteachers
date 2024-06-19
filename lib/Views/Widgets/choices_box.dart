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
          width: 148,
          height: 160,
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.grey, width: 1),
            borderRadius: radius30,
          ),
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                image,
                height: 90,
                //   fit: BoxFit.fill,
              ),
              Text(
                text,
                style: AppTextStyle.body
                    .copyWith(
                        color: AppColors.primary, fontWeight: FontWeight.w700)
                    .apply(fontSizeFactor: .8),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ));
  }
}
