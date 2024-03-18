class SchoolClassification {
  final String? id;
  final String name;

  SchoolClassification({
    required this.id,
    required this.name,
  });

  factory SchoolClassification.fromMap(Map<String, dynamic> json) {
    return SchoolClassification(
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

  SchoolClassification copyWith({
    String? id,
    String? name,
  }) {
    return SchoolClassification(id: id ?? this.id, name: name ?? this.name);
  }
}