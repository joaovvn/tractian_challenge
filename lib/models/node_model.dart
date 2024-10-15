import 'package:tractian_challenge/constants/app_types.dart';
import 'package:tractian_challenge/models/base_model.dart';

class NodeModel extends Base {
  int type;
  String? parentId;
  String? sensorType;
  String? status;
  String? locationId;
  List<NodeModel> childrenNodes = List<NodeModel>.empty(growable: true);

  NodeModel({
    required super.id,
    required super.name,
    required this.type,
    this.parentId,
    this.sensorType,
    this.status,
    this.locationId,
  });

  factory NodeModel.fromJson(Map<String, dynamic> json, {int? type}) {
    return NodeModel(
      id: json['id'],
      name: json['name'],
      type: type ??
          (json['sensorType'] == null ? AppTypes.asset : AppTypes.component),
      parentId: json['parentId'],
      sensorType: json['sensorType'],
      status: json['status'],
      locationId: json['locationId'],
    );
  }
}
