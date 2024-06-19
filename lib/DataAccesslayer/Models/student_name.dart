import 'dart:convert';

class StudentName {
  final String name;
 
  StudentName({
    required this.name,
  });

 factory StudentName.fromJson(Map<String, dynamic> json) => StudentName(
        name: json["name"],
      );

    Map<String, dynamic> toJson() => {
      'name': name,
      };

}
