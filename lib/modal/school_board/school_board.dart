class SchoolBoard {
  final String id;
  final String name;

  SchoolBoard({
    required this.id,
    required this.name,
  });

  factory SchoolBoard.fromMap(Map<String, dynamic> json) {
    return SchoolBoard(
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

  SchoolBoard copyWith({
    String? id,
    String? name,
  }) {
    return SchoolBoard(id: id ?? this.id, name: name ?? this.name);
  }
}