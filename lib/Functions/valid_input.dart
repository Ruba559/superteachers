import 'package:get/get.dart';

validInput(String val, int min, int max, String type , bool? require ,  String? password ) {
  if (require == true && val.isEmpty) {
    return "cant_be_empty".tr;
  } 

  // if (type == "username") {
  //   if (!GetUtils.isUsername(val)) {
  //     return "not valid username";
  //   }
  // }
  if (type == "email") {
    if (!GetUtils.isEmail(val.trim())) {
      return "not_valid_email".tr;
    }
  }

   if (type == "confirmPassword") {
    if (val != password) {
      return "not_match".tr;
    }
  }




  if (require == true && val.length < min) {
    return "${'cant_be_less_than'.tr} $min";
  }

  if (require == true && val.length > max) {
    return "${'cant_be_larger_than'.tr} $max";
  }
}