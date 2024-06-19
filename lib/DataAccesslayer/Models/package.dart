import 'dart:convert';

class Package {
  final int id;
  final String name;
  final int file_count;
  final int days_count;
  final int certificate_count;
  final num price;
  final String createdAt;

  Package({
    required this.id,
    required this.name,
    required this.file_count,
    required this.days_count,
    required this.certificate_count,
    required this.price,
    required this.createdAt,
  });

  factory Package.fromMap(Map<String, dynamic> map) {
    return Package(
      id: map['id'] as int,
      name: map['name'] ?? "",
      file_count: map['file_count'] ?? "",
      days_count: map['days_count'] ?? "",
      certificate_count: map['certificate_count'] ?? "",
      price: map['price'] ?? "",
      createdAt: map['created_at'] ?? "",
    );
  }

  factory Package.fromJson(String source) =>
      Package.fromMap(json.decode(source) as Map<String, dynamic>);

  get user => null;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'file_count': file_count,
      'days_count': days_count,
      'certificate_count': certificate_count,
      'price': price,
      'created_at': createdAt,
    };
  }
}
