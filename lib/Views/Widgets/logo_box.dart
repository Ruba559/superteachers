import 'package:flutter/material.dart';
import 'package:superteachers/Constants/app_style.dart';

import '../../Constants/app_color.dart';
import '../../Constants/app_text_style.dart';

class LogoBox extends StatelessWidget {
  final String image;
  final void Function()? onPressed;
  final Color bordercolor;
  const LogoBox(
      {super.key,
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
                        height: 120,
                        width: 120,
                        fit: BoxFit.contain,
                      ),
                    ],
                  )),
             
            ],
          ),
        ));
  }
}
