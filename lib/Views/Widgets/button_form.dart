import 'package:flutter/material.dart';
import 'package:superteachers/Constants/app_style.dart';

import '../../Constants/app_color.dart';
import '../../Constants/app_text_style.dart';

class ButtonForm extends StatelessWidget {
   final String text;
  final Color color;
  final void Function()? onPressed;
  const ButtonForm({super.key, required this.text, this.onPressed, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: radius10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        onPressed:  onPressed,
        color: color,
        textColor: AppColors.white,
        child: Text(text,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'Cairo')),
      ),
    );
  }
}
