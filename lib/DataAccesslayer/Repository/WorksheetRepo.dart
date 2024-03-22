import 'dart:convert';

import '../Clients/WorksheetClient.dart';
import '../Models/worksheet.dart';

class WorksheetRepo {

  WorksheetClient client = WorksheetClient();

  Future<List<Worksheet>> getWorksheet() async {
    var response = await client.getWorksheet();
    if (response != '') {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed.map<Worksheet>((json) => Worksheet.fromMap(json)).toList();
    }
    return [];
  }
}
