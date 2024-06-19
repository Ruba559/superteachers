import 'dart:convert';

import 'package.dart';

class User {
  final int id;
  final String name;
  final String email;
  final String image;
  final DateTime? expiry_date;
  final String createdAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.expiry_date,
    required this.createdAt,
  });



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "name":name,
      "email": email,
      "image": image,
      "created_at": createdAt,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
       id: map['id'] as int,
      name: map['name'] ?? "",
      email: map['email'] ?? "",
      image: map['image'] ?? "",
      expiry_date: getExpiryDate(map['expiry_date']),
      createdAt: map['created_at'] ?? "",
    );
  }



  String toJson() => json.encode(toMap());
  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);


  // factory User.fromMap(Map<String, dynamic> map) {
  //   return User(
  //     id: map['id'] as int,
  //     name: map['name'] ?? "",
  //     email: map['email'] ?? "",
  //     image: map['image'] ?? "",
  //     package: Package.fromMap(map['package']),
  //     expiry_date: getExpiryDate(map['expiry_date']),
  //     createdAt: map['created_at'] ?? "",
  //   );
  // }

  // factory User.fromJson(String source) =>
  //     User.fromMap(json.decode(source) as Map<String, dynamic>);

  static DateTime? getExpiryDate(date) {
    print(date);
    return (date != null && date.isNotEmpty && date != "null")
        ? DateTime.parse(date)
        : null;
  }

  // Map<String, dynamic> toJson() => {
  //     "id": id,
  //     "name":name,
  //     "email": email,
  //     "image": image,
  //     "created_at": createdAt,
  //  };

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  //   data['email'] = this.email;
  //   data['image'] = this.image;
  //   data['created_at'] = this.createdAt;
  //   return data;
  // }

  
}
