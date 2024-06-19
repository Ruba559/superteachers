import 'dart:convert';

class UserCertificate {
  final int id;
  final int user_id;
  final int certificate_id;
  final int logo_id;
  final String title;
  final String first_text;
  final String second_text;
  final dynamic date;
  final String name;
  final String file;
  final String createdAt;

  UserCertificate({
    required this.id,
    required this.user_id,
    required this.certificate_id,
    required this.logo_id,
    required this.title,
    required this.first_text,
    required this.second_text,
    required this.date,
    required this.name,
    required this.file,
    required this.createdAt,
  });

  factory UserCertificate.fromMap(Map<String, dynamic> map) {
    return UserCertificate(
      id: map['id'] as int,
      user_id: map['user_id'] ,
      certificate_id: map['certificate_id'] ,
      logo_id: map['logo_id'] ,
      title: map['title'] ?? "",
      first_text: map['first_text'] ?? "",
      second_text: map['second_text'] ?? "",
      date: map['date'] ?? "",
      name: map['name'] ?? "",
      file: map['file'] ?? "",
      createdAt: map['created_at'] ?? "",
    );
  }

  factory UserCertificate.fromJson(String source) =>
      UserCertificate.fromMap(json.decode(source) as Map<String, dynamic>);

  get user => null;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': user_id,
      'certificate_id': certificate_id,
      'logo_id': logo_id,
      'title': title,
      'first_text': first_text,
      'second_text': second_text,
      'date': date,
      'name': name,
      'file': file,
      'created_at': createdAt,
    };
  }

  toJson() {}
}
