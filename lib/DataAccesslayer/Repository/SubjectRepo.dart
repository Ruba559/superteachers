import 'dart:convert';

import '../Clients/SubjectClient.dart';
import '../Models/subject.dart';

class SubjectRepo {
  SubjectClient client = SubjectClient();

  Future<List<Subject>> getSubjects() async {
    var response = await client.getSubjects();
    if (response != '') {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed.map<Subject>((json) => Subject.fromMap(json)).toList();
    }
    return [];
  }
}
