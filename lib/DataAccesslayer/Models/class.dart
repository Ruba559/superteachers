import 'dart:convert';

class Class {
  final int id;
  final String name;
  final String createdAt;
 
  Class({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  factory Class.fromMap(Map<String, dynamic> map) {
    return Class(
        id: map['id'] as int,
        name: map['name'] ?? "",
        createdAt: map['created_at'] ?? "",
        );
  }
  

  factory Class.fromJson(String source) =>
      Class.fromMap(json.decode(source) as Map<String, dynamic>);

  get user => null;


 Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'created_at' : createdAt,
    
    };
  }

}
