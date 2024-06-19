import 'dart:convert';

class Certificate {
  final int id;
  final String name;
  final String createdAt;
 
  Certificate({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  factory Certificate.fromMap(Map<String, dynamic> map) {
    return Certificate(
        id: map['id'] as int,
        name: map['name'] ?? "",
        createdAt: map['created_at'] ?? "",
        );
  }
  

  factory Certificate.fromJson(String source) =>
      Certificate.fromMap(json.decode(source) as Map<String, dynamic>);

  get user => null;


 Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'created_at' : createdAt,
    
    };
  }

}
