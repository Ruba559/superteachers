import 'dart:convert';

import '../Clients/ClassCllient.dart';
import '../Models/class.dart';
import '../Models/semester.dart';

class ClassRepo {
  ClassClient client = ClassClient();

  Future<List<Class>> getClasses() async {
    var response = await client.getClasses();
    if (response != '') {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed.map<Class>((json) => Class.fromMap(json)).toList();
    }
    return [];
  }
  
    Future<List<Semester>> getSemesters() async {
    var response = await client.getSemesters();
    if (response != '') {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed.map<Semester>((json) => Semester.fromMap(json)).toList();
    }
    return [];
  }
}
