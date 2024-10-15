import 'package:tractian_challenge/models/base_model.dart';

class Company extends Base {
  Company({required super.id, required super.name});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      name: json['name'],
    );
  }
}
