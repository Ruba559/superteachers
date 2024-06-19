import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Constants/api.dart';

class ClassClient {
  var client = http.Client();

  ClassClient();

  Future<dynamic> getClasses() async {
    var response = await client.get(Uri.parse(baseUrl + classes));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
  }

    Future<dynamic> getSemesters() async {
    var response = await client.get(Uri.parse(baseUrl + semesters));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
  }
}
