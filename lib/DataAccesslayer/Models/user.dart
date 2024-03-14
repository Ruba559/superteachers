import 'dart:convert';

class User {
  final int id;
  final String name;
  final String email;
  final String avatar;
  final String createdAt;
 
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.createdAt,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        id: map['id'] as int,
        name: map['name'] ?? "",
        email: map['email'] ?? "",
        avatar: map['avatar'] ?? "",
        createdAt: map['created_at'] ?? "",
        );
  }
  

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  get user => null;


 Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'avatar' : avatar,
      'created_at' : createdAt,
    
    };
  }

}
