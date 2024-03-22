import 'package:flutter/material.dart';
import 'package:superteachers/Constants/app_style.dart';

class InputForm extends StatelessWidget {
  final String? hinttext ;
  final String? labeltext;
  // final IconData iconData;
  final String? Function(String?) valid;
  final TextEditingController? mycontroller;

  const InputForm(
      {super.key,
      this.hinttext,
      this.labeltext,
      this.mycontroller,
      required this.valid,
      TextStyle? labelStyle,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        validator: valid,
        controller: mycontroller,
        textAlign: TextAlign.start,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            hintText: hinttext,
            filled: true,
            // hintStyle: const TextStyle(fontSize: 22 , color: Colors.white),
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 5),

            // suffixIcon: Icon(iconData),
            border: OutlineInputBorder(borderRadius: radius10)),
      ),
    );
  }
}
