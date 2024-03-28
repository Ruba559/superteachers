import 'dart:convert';

import '../Clients/WorksheetClient.dart';
import '../Models/worksheet.dart';

class WorksheetRepo {

  WorksheetClient client = WorksheetClient();

  Future<List<Worksheet>> getWorksheet(semester , classe , subject) async {
    var response = await client.getWorksheet(semester , classe , subject);
    if (response != '') {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed.map<Worksheet>((json) => Worksheet.fromMap(json)).toList();
    }
    return [];
  }

    Future<List<Worksheet>> getWorksheetsByUser() async {
    var response = await client.getWorksheetsByUser();
    if (response != '') {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed.map<Worksheet>((json) => Worksheet.fromMap(json)).toList();
    }
    return [];
  }
}
