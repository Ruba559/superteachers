import 'package:flutter/material.dart';
import 'package:superteachers/Constants/app_style.dart';

import '../../Constants/app_text_style.dart';

class LabelForm extends StatelessWidget {
    final String? text;
  
  const LabelForm({super.key,  this.text });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Text(text! , style: AppTextStyle.body, )
    );
  }
}