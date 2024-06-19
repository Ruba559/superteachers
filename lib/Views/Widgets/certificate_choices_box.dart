import 'package:flutter/material.dart';
import 'package:superteachers/Constants/app_style.dart';

import '../../Constants/app_color.dart';
import '../../Constants/app_text_style.dart';

class CertificateChoicesBox extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final String body;
  final Color color;
  final IconData icon;
  const CertificateChoicesBox(
      {super.key,
      required this.text,
      this.onPressed,
      required this.body,
      required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Container(
         width: 310,
          decoration: BoxDecoration(
            
          color: color,
            border: Border.all(
                color: AppColors.grey,
                width:  color == AppColors.white ? 1 :2),
            borderRadius: radius30,
          ),
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: Row(children: [
          Icon(icon , size: 45, color: color == AppColors.white ? AppColors.primary:AppColors.white ,),
           SizedBox(width: 15,),
          Flexible( child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(
            text,
            style: AppTextStyle.medium
                .copyWith(color: color == AppColors.white ? AppColors.primary : AppColors.white, height: 1.5),
           
          ),
          SizedBox(height: 6,),
          Text(
            
            body,
            style: AppTextStyle.xsmall
                .copyWith(color: color == AppColors.white ? AppColors.primary : AppColors.white, height: 1.5 ),
              
           
          )],)) 
          ],) 
        ));
  }
}
