import 'dart:convert';

class Worksheet {
  final int id;
  final String title;
  final String image;
  final String file;
  final int categoryId;
  final String createdAt;

  Worksheet({
    required this.id,
    required this.title,
    required this.image,
    required this.file,
    required this.categoryId,
    required this.createdAt,
  });

  factory Worksheet.fromMap(Map<String, dynamic> map) {
    return Worksheet(
      id: map['id'] as int,
      title: map['title'] ?? "",
      image: map['image'] ?? "",
      file: map['file'] ?? "",
      categoryId: map['category_id'] ?? "",
      createdAt: map['created_at'] ?? "",
    );
  }

  factory Worksheet.fromJson(String source) =>
      Worksheet.fromMap(json.decode(source) as Map<String, dynamic>);

  get user => null;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'file': file,
      'category_id': createdAt,
      'created_at': createdAt,
    };
  }
}
