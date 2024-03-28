import 'dart:convert';

class User {
  final int id;
  final String name;
  final String email;
  final String image;
  final int packageId;
  final String createdAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.packageId,
    required this.createdAt,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] ?? "",
      email: map['email'] ?? "",
      image: map['image'] ?? "",
      packageId: map['package_id'] ?? 0,
      createdAt: map['created_at'] ?? "",
    );
  }

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'image': image,
      'package_id': packageId,
      'created_at': createdAt,
    };
  }

  toJson() {}
}
