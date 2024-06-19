import 'dart:convert';

import 'package:superteachers/DataAccesslayer/Clients/EducationalSubjectClient.dart';

import '../Models/educational_subject.dart';


class EducationalSubjectRepo {
  EducationalSubjectClient client = EducationalSubjectClient();

  Future<List<EducationalSubject>> getEducationalSubjects(subject , semester , classe) async {
    var response = await client.getEducationalSubjects(subject , semester , classe);
    if (response != '') {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed
          .map<EducationalSubject>((json) => EducationalSubject.fromMap(json))
          .toList();
    }
    return [];
  }



 
}
