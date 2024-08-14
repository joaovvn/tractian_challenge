class Location {
  String id;
  String name;
  String? parentId;

  Location({
    required this.id,
    required this.name,
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
