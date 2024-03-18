

class SearchSchool {
  final String id;
  final String name;
  final String contactNumber;
  final String mail;
  final String website;
  final String classFrom;
  final String classTo;
  final Classification classification;
  final List<SchoolType> type;
  final City city;
  final String slug;
  final List<String> images;
  final List<SchoolBoard> schoolBoards;
  final int establishmentYear;
  final int minFees;
  final int maxFees;
  final int avgRating;
  final bool isFeatured;
  final bool published;
  final bool isFavorite;

  SearchSchool({
    required this.id,
    required this.name,
    required this.contactNumber,
    required this.mail,
    required this.website,
    required this.classFrom,
    required this.classTo,
    required this.classification,
    required this.type,
    required this.city,
    required this.slug,
    required this.images,
    required this.schoolBoards,
    required this.establishmentYear,
    required this.minFees,
    required this.maxFees,
    required this.avgRating,
    required this.isFeatured,
    required this.published,
    required this.isFavorite,
  });

  factory SearchSchool.fromMap(Map<String, dynamic> map) {
    return SearchSchool(
      id: map['_id'],
      name: map['name'],
      contactNumber: map['contactNumber'],
      mail: map['mail'],
      website: map['website'],
      classFrom: map['classFrom'],
      classTo: map['classTo'],
      classification: Classification.fromMap(map['classification']),
      type: List<SchoolType>.from(map['type'].map((type) => SchoolType.fromMap(type))),
      city: City.fromMap(map['city']),
      slug: map['slug'],
      images: List<String>.from(map['images']),
      schoolBoards: List<SchoolBoard>.from(map['schoolBoards'].map((board) => SchoolBoard.fromMap(board))),
      establishmentYear: map['establishmentYear'],
      minFees: map['minFees'],
      maxFees: map['maxFees'],
      avgRating: map['avgRating'],
      isFeatured: map['isFeatured'],
      published: map['published'],
      isFavorite: map['isFavorite'],
    );
  }
}

class Classification {
  final String id;
  final String name;

  Classification({
    required this.id,
    required this.name,
  });

  factory Classification.fromMap(Map<String, dynamic> map) {
    return Classification(
      id: map['_id'],
      name: map['name'],
    );
  }
}

class SchoolType {
  final String id;
  final String name;

  SchoolType({
    required this.id,
    required this.name,
  });

  factory SchoolType.fromMap(Map<String, dynamic> map) {
    return SchoolType(
      id: map['_id'],
      name: map['name'],
    );
  }
}

class City {
  final String id;
  final String city;

  City({
    required this.id,
    required this.city,
  });

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      id: map['_id'],
      city: map['city'],
    );
  }
}

class SchoolBoard {
  final String id;
  final String name;

  SchoolBoard({
    required this.id,
    required this.name,
  });

  factory SchoolBoard.fromMap(Map<String, dynamic> map) {
    return SchoolBoard(
      id: map['_id'],
      name: map['name'],
    );
  }
}


