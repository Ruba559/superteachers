import 'package:get/get.dart';

import '../Constants/routes.dart';
import '../main.dart';


class SplashController extends GetxController {
  // LocationHelper locationHelper = LocationHelper();
  // BoxClient boxClient = BoxClient();
  // Coordinates? locationData;
  // SettingsRepo repo = SettingsRepo();

  // Future<void> requestCurrentLocation() async {
  //   locationData = await locationHelper.getCurrentLocation();
  //   if (locationData != null) {
  //     Future.delayed(const Duration(seconds: 3)).then((value) async {
  //       MyApp.currentLocationData = locationData;
  //       await checkAuthed();
  //     });
  //   } else {
  //     Get.dialog(barrierDismissible: false, RequestLocationDialog());
  //   }
  // }

  // Future<void> checkAuthed() async {
  //   bool authed = await boxClient.getAuthState();
  //   if (authed == true) {
  //     MyApp.appUser = await boxClient.getAuthedUser();
  //     Future.delayed(const Duration(seconds: 3))
  //         .then((value) => Get.offAndToNamed(AppRoutes.homeScreen));
  //   } else {
  //     Future.delayed(const Duration(seconds: 3))
  //         .then((value) => Get.offAndToNamed(AppRoutes.otpRegisterScreen));
  //   }
  // }

  Future<void> getInitialSettings() async {
   // MyApp.initialSettings = await repo.getInitialSettings();
        Future.delayed(const Duration(seconds: 3))
          .then((value) => Get.offAndToNamed(AppRoute.onboarding));
  }

  @override
  void onInit() async {
   // await requestCurrentLocation();
    await getInitialSettings();
    super.onInit();
  }
}