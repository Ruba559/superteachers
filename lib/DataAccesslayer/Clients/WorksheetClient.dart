import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Constants/api.dart';

class WorksheetClient {
  var client = http.Client();

  WorksheetClient();

  Future<dynamic> getWorksheet() async {
    var response = await client.get(Uri.parse(baseUrl + worksheets));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
  }
}
