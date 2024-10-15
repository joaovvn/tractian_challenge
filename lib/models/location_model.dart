import 'package:tractian_challenge/models/base_model.dart';

class Location extends Base {
  String? parentId;

  Location({
    required super.id,
    required super.name,
    this.parentId,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      name: json['name'],
      parentId: json['parentId'],
    );
  }
}
