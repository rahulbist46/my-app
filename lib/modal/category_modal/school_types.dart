class SchoolType {
  final String? id;
  final String name;

  SchoolType({
    required this.id,
    required this.name,
  });

  factory SchoolType.fromMap(Map<String, dynamic> json) {
    return SchoolType(
      id: json['_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'name': name,
    };
  }

  SchoolType copyWith({
    String? id,
    String? name,
  }) {
    return SchoolType(id: id ?? this.id, name: name ?? this.name);
  }
}