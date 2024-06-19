import 'dart:convert';

class EducationalSubject {
  final int id;
  final String file;
  final String name;
  final String createdAt;
 
  EducationalSubject({
    required this.id,
    required this.file,
    required this.name,
    required this.createdAt,
  });

  factory EducationalSubject.fromMap(Map<String, dynamic> map) {
    return EducationalSubject(
        id: map['id'] as int,
        name: map['name'] ?? "",
        file: map['file'] ?? "",
        createdAt: map['created_at'] ?? "",
        );
  }
  

  factory EducationalSubject.fromJson(String source) =>
      EducationalSubject.fromMap(json.decode(source) as Map<String, dynamic>);



 Map<String, dynamic> toMap() {
    return {
      'id': id,
      'file': file,
      'name': name,
      'created_at' : createdAt,
    
    };
  }

}
