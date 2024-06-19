import 'dart:convert';

class UserFile {
  final int id;
  final String title;
  final String file;
  final String logo;
  final String createdAt;

  UserFile({
    required this.id,
    required this.title,
    required this.file,
    required this.logo,
    required this.createdAt,
  });

  factory UserFile.fromMap(Map<String, dynamic> map) {
    return UserFile(
      id: map['id'] as int,
      title: map['title'] ?? "",
      logo: map['logo'] ?? "",
      file: map['file'] ?? "",
      createdAt: map['created_at'] ?? "",
    );
  }

  factory UserFile.fromJson(String source) =>
      UserFile.fromMap(json.decode(source) as Map<String, dynamic>);

  get user => null;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'logo': logo,
      'file': file,
      'created_at': createdAt,
    };
  }

  toJson() {}
}
