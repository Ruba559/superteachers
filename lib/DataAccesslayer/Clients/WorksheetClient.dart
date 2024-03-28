import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Constants/api.dart';

class WorksheetClient {
  var client = http.Client();

  WorksheetClient();

  Future<dynamic> getWorksheet(semester , classe , subject) async {
    var response = await client.get(Uri.parse(baseUrl + worksheets + "/$semester" + "/$classe" + "/$subject"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
  }

   Future<dynamic> getWorksheetsByUser() async {
    var response = await client.get(Uri.parse(baseUrl + worksheetsByUser ));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
  }
}
