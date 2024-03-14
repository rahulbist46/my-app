
class CitiesModel {
  final String id;
  final String city;
  final String country;
  final String state;
  final String icon;

  const CitiesModel({
    required this.id,
    required this.city,
    required this.country,
    required this.state,
    required this.icon,
  });

  factory CitiesModel.fromMap(Map<String, dynamic> json) => CitiesModel(
    id: json['_id'],
    city: json['city'],
    country: json['country'],
    state: json['state'],
    icon: json['icon']
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'city': city,
      'country': country,
      'state': state,
      'icon': icon,
    };
  }
}