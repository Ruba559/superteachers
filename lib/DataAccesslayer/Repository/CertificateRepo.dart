import 'dart:convert';

import '../Clients/CertificateClient.dart';
import '../Models/certificate.dart';
import '../Models/logo.dart';
import '../Models/user_certificate.dart';

class CertificateRepo {
  CertificateClient client = CertificateClient();

  Future<List<Certificate>> getCertificate() async {
    var response = await client.getCertificate();
    if (response != '') {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed
          .map<Certificate>((json) => Certificate.fromMap(json))
          .toList();
    }
    return [];
  }

  Future<List<UserCertificate>> getUserCertificate(user_id) async {
    var response = await client.getUserCertificate(user_id);
    if (response != '') {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed
          .map<UserCertificate>((json) => UserCertificate.fromMap(json))
          .toList();
    }
    return [];
  }
  Future<List<Logo>> getLogos(user_id) async {
    var response = await client.getLogos(user_id);
    if (response != '') {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed.map<Logo>((json) => Logo.fromMap(json)).toList();
    }
    return [];
  }

  Future<dynamic> addLogo(user_id, image) async {
 //   if (await client.addLogouser(user_id, image) != '') {
      var response = await client.addLogouser(user_id, image);
      print('hi2');
      return Logo.fromJson(response);
    // } else {
    //   return '';
    // }
  }

   Future<dynamic> createCertificate(user_id, logo_id , certificateType ,  title , subtitle , body , date , sign ) async {
    // if (await client.createCertificate(user_id, logo_id , certificateType ,  title , subtitle , body , date , sign ) !=
    //     '') {
      var response =
          await client.createCertificate(user_id, logo_id , certificateType ,  title , subtitle , body , date , sign );

      return UserCertificate.fromJson(response);
    // } else {
    //   return '';
    // }
  }
}
