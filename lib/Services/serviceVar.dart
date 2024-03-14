import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceVar extends GetxService {
  
  late SharedPreferences sharedPreferences ; 

  Future<ServiceVar> init() async {
  sharedPreferences =   await SharedPreferences.getInstance() ; 
  return this ; 
  }

}

initialServices() async  {
  await Get.putAsync(() => ServiceVar().init()) ; 
}