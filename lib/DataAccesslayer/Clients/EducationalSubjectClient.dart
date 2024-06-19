import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Constants/api.dart';

class EducationalSubjectClient {
  var client = http.Client();

  EducationalSubjectClient();

  Future<dynamic> getEducationalSubjects(subject , semester , classe) async {
    var response = await client.get(Uri.parse(
        baseUrl + educational_subjects + "/$subject" + "/$semester" + "/$classe"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
  }




}
