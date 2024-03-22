import 'package:flutter/material.dart';

import '../../Constants/app_color.dart';
import '../../Constants/app_text_style.dart';

class CreateWeorksheetTitle extends StatelessWidget {
  final String text;
  const CreateWeorksheetTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
       text,
        style: AppTextStyle.body
            .copyWith(color: AppColors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}
