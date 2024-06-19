import 'package:flutter/material.dart';

import '../../Constants/app_color.dart';
import '../../Constants/app_text_style.dart';

class CreateWeorksheetTitle extends StatelessWidget {
  final String text;
  final double? width ;
  const CreateWeorksheetTitle({super.key, required this.text,  this.width = double.infinity});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        child: ListTile(
          title: Text(
            text,
            style: AppTextStyle.body
                .copyWith(color: AppColors.black, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
