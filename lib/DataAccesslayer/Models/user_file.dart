import 'dart:convert';

class UserFile {
  final int id;
  final int userId;
  final int worksheetId;
  final String file;
  final String createdAt;

  UserFile({
    required this.id,
    required this.userId,
    required this.worksheetId,
    required this.file,
    required this.createdAt,
  });

  factory UserFile.fromMap(Map<String, dynamic> map) {
    return UserFile(
      id: map['id'] as int,
      userId: map['user_id'] ?? "",
      worksheetId: map['worksheet_id'] ?? "",
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
      'user_id': userId,
      'worksheet_id': worksheetId,
      'file': file,
      'created_at': createdAt,
    };
  }

  toJson() {}
}
