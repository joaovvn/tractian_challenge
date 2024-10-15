import 'package:tractian_challenge/models/base_model.dart';

class Asset extends Base {
  String? parentId;
  String? sensorId;
  String? sensorType;
  String? status;
  String? gatewayId;
  String? locationId;

  Asset({
    required super.id,
    required super.name,
    this.parentId,
    this.sensorId,
    this.sensorType,
    this.status,
    this.gatewayId,
    this.locationId,
  });

  factory Asset.fromJson(Map<String, dynamic> json) {
    return Asset(
      id: json['id'],
      name: json['name'],
      parentId: json['parentId'],
      sensorId: json['sensorId'],
      sensorType: json['sensorType'],
      status: json['status'],
      gatewayId: json['gatewayId'],
      locationId: json['locationId'],
    );
  }
}
