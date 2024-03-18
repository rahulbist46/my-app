class Facility {
  final String? icon;
  final String? name;

  const Facility({this.icon, this.name});

  Facility copyWith({
    String? icon,
    String? name,
  }) {
    return Facility(
      icon: icon ?? this.icon,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'icon': icon,
      'name': name?.toLowerCase().trim(),
    };
  }

  factory Facility.fromMap(Map<String, dynamic> map) {
    return Facility(
      icon: map['icon'] != null ? map['icon'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }
}
