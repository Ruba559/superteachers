import 'dart:convert';

import 'package:superteachers/DataAccesslayer/Models/user_file.dart';

import '../Clients/WorksheetClient.dart';
import '../Models/worksheet.dart';
import '../Models/user_file.dart';

class WorksheetRepo {
  WorksheetClient client = WorksheetClient();

  Future<List<Worksheet>> getWorksheet(semester, classe, subject) async {
    var response = await client.getWorksheet(semester, classe, subject);
    if (response != '') {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed.map<Worksheet>((json) => Worksheet.fromMap(json)).toList();
    }
    return [];
  }

  Future<List<UserFile>> getWorksheetsUser(user_id) async {
    var response = await client.getWorksheetsUser(user_id);
    if (response != '') {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed.map<UserFile>((json) => UserFile.fromMap(json)).toList();
    }
    return [];
  }

  Future<List<UserFile>> getWorksheetsByUser(user_id, worksheet_id) async {
    var response = await client.getWorksheetsByUser(user_id, worksheet_id);
    if (response != '') {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed.map<UserFile>((json) => UserFile.fromMap(json)).toList();
    }
    return [];
  }

  Future<dynamic> createWorksheet(user_id, worksheet_id, title, logo) async {
    if (await client.createWorksheet(user_id, worksheet_id, title, logo) !=
        '') {
      var response =
          await client.createWorksheet(user_id, worksheet_id, title, logo);

      return UserFile.fromJson(response);
    } else {
      return '';
    }
  }
}
