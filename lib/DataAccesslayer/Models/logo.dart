import 'dart:convert';

class Logo {
  final int id;
  final String name;
  final String image;
  final String createdAt;

  Logo({
    required this.id,
    required this.name,
    required this.image,
    required this.createdAt,
  });

  factory Logo.fromMap(Map<String, dynamic> map) {
    return Logo(
      id: map['id'] as int,
      name: map['name'] ?? "",
      image: map['image'] ?? "",
      createdAt: map['created_at'] ?? "",
    );
  }

  factory Logo.fromJson(String source) =>
      Logo.fromMap(json.decode(source) as Map<String, dynamic>);

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
