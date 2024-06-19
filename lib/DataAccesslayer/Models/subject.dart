import 'dart:convert';

class Subject {
  final int id;
  final String name;
  final String image;
  final String createdAt;

  Subject({
    required this.id,
    required this.name,
    required this.image,
    required this.createdAt,
  });

  factory Subject.fromMap(Map<String, dynamic> map) {
    return Subject(
      id: map['id'] as int,
      name: map['name'] ?? "",
      image: map['image'] ?? "",
      createdAt: map['created_at'] ?? "",
    );
  }

  factory Subject.fromJson(String source) =>
      Subject.fromMap(json.decode(source) as Map<String, dynamic>);

  get user => null;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'created_at': createdAt,
    };
  }
}
