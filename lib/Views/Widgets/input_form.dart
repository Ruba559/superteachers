import 'package:flutter/material.dart';
import 'package:superteachers/Constants/app_style.dart';

class InputForm extends StatelessWidget {
  final String? hinttext;
  final String? labeltext;
  // final IconData iconData;
  final bool passwordText;
  final String? Function(String?) valid;
  final TextEditingController? mycontroller;
  final int? isTextarea;
  final void Function()? onTap;

  final void Function(String?)? onChanged;

  const InputForm({
    super.key,
    this.hinttext,
    this.labeltext,
    this.mycontroller,
    required this.valid,
    TextStyle? labelStyle,
    this.passwordText = false,
    this.isTextarea = 1,
    this.onTap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        onChanged: onChanged,
        onTap: onTap,
        maxLines: isTextarea != 1 ? isTextarea : 1,
        validator: valid,
        obscureText: passwordText,
        controller: mycontroller,
        textAlign: TextAlign.start,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            hintText: hinttext,
            filled: true,
            // hintStyle: const TextStyle(fontSize: 22 , color: Colors.white),
            fillColor: Colors.white,
            contentPadding: isTextarea != 1
                ? EdgeInsets.symmetric(horizontal: 10, vertical: 10)
                : EdgeInsets.symmetric(horizontal: 5),

            // suffixIcon: Icon(iconData),
            border: OutlineInputBorder(borderRadius: radius10)),
      ),
    );
  }
}
