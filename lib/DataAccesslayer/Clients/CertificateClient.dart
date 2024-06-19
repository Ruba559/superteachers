import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Constants/api.dart';

class CertificateClient {
  var client = http.Client();

  CertificateClient();

  Future<dynamic> getCertificate() async {
    var response = await client.get(Uri.parse(
        baseUrl + certificates ));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
  }

   Future<dynamic> getUserCertificate(user_id) async {
    var response = await client.get(Uri.parse(
        baseUrl + userCertificates + "/$user_id"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
  }

 Future<dynamic> getLogos(user_id) async {
    var response = await client.get(Uri.parse(
        baseUrl + logos  + "/$user_id" ));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
  }


 Future<dynamic> addLogouser(user_id ,  image) async {
    var request =
        http.MultipartRequest('POST', Uri.parse(baseUrl + logo));

    request.fields.addAll({
      'user_id': user_id.toString(),
    });

    request.files.add(await http.MultipartFile.fromPath('image', image));
 
    var response = await request.send();
    if (response.statusCode == 200) {
      return response.stream.bytesToString();
    } else {
      return '';
    }
  }

   Future<dynamic> createCertificate(user_id, logo_id , certificateType ,  title , subtitle , body , date , sign ) async {

     var url = Uri.parse(baseUrl + certificate);

    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
             'user_id': user_id,
      'logo_id': logo_id,
      'certificate_id': certificateType,
      'title': title,
      'first_text': subtitle,
      'second_text': body,
      'date': date,
      'name': sign,
      }),
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
    
  }
}
