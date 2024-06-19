import 'package:flutter/material.dart';
import 'package:superteachers/Constants/app_style.dart';

import '../../Constants/app_color.dart';
import '../../Constants/app_text_style.dart';

class ButtonForm extends StatelessWidget {
  final String text;
  final Color color;
  final double? width;
  final void Function()? onPressed;
  final bool isLoading ;
  const ButtonForm(
      {super.key,
      required this.text,
      this.onPressed,
      required this.color,
      this.width = double.infinity,  this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return          Container(
    //   width: width,
       margin: const EdgeInsets.all(10), 
     child: ElevatedButton(
      
        onPressed: isLoading ? () {} : onPressed,
        style: ButtonStyle(
  elevation: MaterialStatePropertyAll(0),
  backgroundColor:
      MaterialStatePropertyAll<Color>(color),
  shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: radius10,
    ),
  ),
  minimumSize: MaterialStatePropertyAll<Size>(
    Size(double.infinity, 44),
  ),
)
,
        child: Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                textAlign: isLoading ? TextAlign.right : TextAlign.center,
                softWrap: true,
                style:   AppTextStyle.body.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 10,),
          if (isLoading)   CircularProgressIndicator(
           color: Colors.white,
             strokeWidth: 1,
           
          )
            ],
          ),
        )));
    //      Container(
    //   width: width,
    //   margin: const EdgeInsets.all(10),
    //   child: MaterialButton(
    //     shape: RoundedRectangleBorder(borderRadius: radius10),
    //     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
    //     onPressed: onPressed,
    //     color: color,
    //     textColor: AppColors.white,
    //     child: isLoading ?  CircularProgressIndicator(
    //         color: Colors.white,
    //         strokeWidth: 2,
    //       ): Text(text,
    //         style: AppTextStyle.body.copyWith(fontWeight: FontWeight.bold)),
    //   ),
    // );
  }
}
