class Base {
  String id;
  String name;

  Base({
    required this.id,
    required this.name,
  });

  factory Base.fromJson(Map<String, dynamic> json) {
    return Base(
      id: json['id'],
      name: json['name'],
    );
  }
}
