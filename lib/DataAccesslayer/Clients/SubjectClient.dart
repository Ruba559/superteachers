import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Constants/api.dart';

class SubjectClient {
  var subject = http.Client();

  SubjectClient();

  Future<dynamic> getSubjects() async {
    var response = await subject.get(Uri.parse(baseUrl + subjects));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
  }
}
