import 'package:get_storage/get_storage.dart';
import 'package:superteachers/DataAccesslayer/Models/student_name.dart';



class BoxStorageName {
  final box = GetStorage();

  Future<List<StudentName>> getNames() async {
    var items = await box.read('names');
    print(items);
    if (items != null && items != "") {
      final data = items.cast<Map<String, dynamic>>();
      return data.map<StudentName>((json) => StudentName.fromJson(json)).toList();
    }

    return [];
  }

  Future<void> addName(List<StudentName> items) async {
    await box.remove('names');
    var map = items.map((item) => item.toJson());
    await box.write('names', map.toList());
    
  }

}
