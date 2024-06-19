import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Constants/api.dart';

class WorksheetClient {
  var client = http.Client();

  WorksheetClient();

  Future<dynamic> getWorksheet(semester, classe, subject) async {
    var response = await client.get(Uri.parse(
        baseUrl + worksheets + "/$semester" + "/$classe" + "/$subject"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
  }

  Future<dynamic> getWorksheetsUser(user_id) async {
    var response =
        await client.get(Uri.parse(baseUrl + worksheetsUser + "/$user_id"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
  }

  Future<dynamic> getWorksheetsByUser(user_id, worksheet_id) async {
    var response = await client.get(
        Uri.parse(baseUrl + worksheetsByUser + "/$user_id" + "/$worksheet_id"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
  }

  Future<dynamic> createWorksheet(user_id, worksheet_id, title, logo) async {
    var request = http.MultipartRequest('POST', Uri.parse(baseUrl + worksheet));
    request.fields.addAll({
      'user_id': user_id.toString(),
      'worksheet_id': worksheet_id.toString(),
      'title': title.toString(),
    });
    if (logo.isNotEmpty) {
      request.files.add(await http.MultipartFile.fromPath('logo', logo));
    }

    var response = await request.send();

    if (response.statusCode == 200) {
      return response.stream.bytesToString();
    } else {
      return '';
    }
  }
}
