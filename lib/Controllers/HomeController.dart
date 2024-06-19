import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Constants/routes.dart';
import '../DataAccesslayer/Clients/BoxStorage.dart';
import '../DataAccesslayer/Models/expirydate.dart';
import '../DataAccesslayer/Repository/UserRepo.dart';
import '../main.dart';
import 'package:superteachers/Views/Widgets/snackbar.dart';

class HomeController extends GetxController {
  UserRepo userRepo = UserRepo();
  BoxStorage boxStorage = BoxStorage();
  late Expirydate expirydate;

  void onInit() {
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   print('Got a message whilst in the foreground!');
    //   print('Message data: ${message.data}');

    //   if (message.notification != null) {
    //     print('Message also contained a notification: ${message.notification}');
    //     SnackBars.showWarning(message.notification!.title);
    //   }
    // });
    // whenClickMessageBackground();
    // whenClickMessageTerminated();
    super.onInit();
  }

  getSemesters() async {
    expirydate = await userRepo.getExpirydate(MyApp.user!.id);

    if (expirydate.availble_days <= 0) {
      SnackBars.showWarning('تم انتهاء الاشتراك');
    } else {
      if (expirydate.availble_files <= 0) {
        SnackBars.showWarning('لقد تجاوزت الحد المتوفر لديك لأوراق العمل ');
      } else {
        Get.toNamed(AppRoute.semesters);
      }
    }
  //  await FirebaseMessaging.instance.subscribeToTopic('weather');

   //await sendMessage('title', 'message');
  }

  getClasses() async {
  
        Get.toNamed(AppRoute.classesEdu);
    
 
  }

  sendNotification() async {
    String? token = await FirebaseMessaging.instance.getToken();
    sendMessage('title', 'message');
    print(token);
  }

  sendMessage(title, message) async {
 
    var headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'key=AAAAHFYt_zo:APA91bGI6S_31XXEXEdI17dYunBY_0Z7qaO16KjpSnmTkg6C78CXZt6ACeKr5FcCJ_pRmKYS_lwFaHybiowc3EanTVN1vsiUH4uhbZxFWWe1h7YXZ_FXRzCqfxH1XBTm39P2pnDDLRM_'
    };
    var request =
        http.Request('POST', Uri.parse('https://fcm.googleapis.com/fcm/send'));
    request.body = json.encode({
      "to": "/topics/weather",
     // "to" : "cu-JYsk6TiW8lgsCkvrerh:APA91bE2zBx0sa8dCsKltVTGh9xMJAQUhwz2UQCnCNUDVHSvM4ZEvMtDKELtcm49XM9xeysAZN_KzfUvOhZKxPn5irJ1UnaD0GUeuw16-dlYLVk9X4hFF2AbiFke34iKBOtA3-KPrMHE",
      "notification": {
        "title": title.toString(),
        "body": message.toString(),
        "mutable_content": true,
        "sound": "Tri-tone"
      },
      "data": {
        "url": "<url of media image>",
        "dl": "<deeplink action on tap of notification>"
      }
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  void whenClickMessageBackground() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      Get.toNamed(AppRoute.profile);
      print('hi open');
    });
  }

  void whenClickMessageTerminated() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    print('open t');
  }

 
  getFiles()
  {
     Get.toNamed(AppRoute.files);
  }
}
