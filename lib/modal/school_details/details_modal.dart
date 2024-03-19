class DetailsModal {
  String id;
  String name;
  String chairman;
  String medium;
  String admissionStart;
  String admissionEnd;
  String contactNumber;
  String mail;
  String website;
  String about;
  String classFrom;
  String classTo;
  Classification classification;
  List<Classification> type;
  City city;
  Slug slug;
  List<String> images;
  List<Classification> schoolBoards;
  List<Classification> facilities;
  int establishmentYear;
  int minFees;
  int maxFees;
  int avgRating;
  int avgAcademicsRating;
  int avgAddmissionRating;
  int avgExtracurriclarRating;
  int avgInfrastructureRating;
  bool isFeatured;
  bool published;
  DateTime createdAt;
  DateTime updatedAt;
  List<dynamic> reviews;
  bool isFavorite;
  String detailsModalId;

  DetailsModal({
    required this.id,
    required this.name,
    required this.chairman,
    required this.medium,
    required this.admissionStart,
    required this.admissionEnd,
    required this.contactNumber,
    required this.mail,
    required this.website,
    required this.about,
    required this.classFrom,
    required this.classTo,
    required this.classification,
    required this.type,
    required this.city,
    required this.slug,
    required this.images,
    required this.schoolBoards,
    required this.facilities,
    required this.establishmentYear,
    required this.minFees,
    required this.maxFees,
    required this.avgRating,
    required this.avgAcademicsRating,
    required this.avgAddmissionRating,
    required this.avgExtracurriclarRating,
    required this.avgInfrastructureRating,
    required this.isFeatured,
    required this.published,
    required this.createdAt,
    required this.updatedAt,
    required this.reviews,
    required this.isFavorite,
    required this.detailsModalId,
  });

  factory DetailsModal.fromMap(Map<String, dynamic> map) {
    return DetailsModal(
      id: map['_id'],
      name: map['name'],
      chairman: map['chairman'],
      medium: map['medium'],
      admissionStart: map['admissionStart'],
      admissionEnd: map['admissionEnd'],
      contactNumber: map['contactNumber'],
      mail: map['mail'],
      website: map['website'],
      about: map['about'],
      classFrom: map['classFrom'],
      classTo: map['classTo'],
      classification: Classification.fromMap(map['classification']),
      type: List<Classification>.from(
          map['type'].map((x) => Classification.fromMap(x))),
      city: City.fromMap(map['city']),
      slug: Slug.fromMap(map['slug']),
      images: List<String>.from(map['images'].map((x) => x)),
      schoolBoards: List<Classification>.from(
          map['schoolBoards'].map((x) => Classification.fromMap(x))),
      facilities: List<Classification>.from(
          map['facilities'].map((x) => Classification.fromMap(x))),
      establishmentYear: map['establishmentYear'],
      minFees: map['minFees'],
      maxFees: map['maxFees'],
      avgRating: map['avgRating'],
      avgAcademicsRating: map['avgAcademicsRating'],
      avgAddmissionRating: map['avgAddmissionRating'],
      avgExtracurriclarRating: map['avgExtracurriclarRating'],
      avgInfrastructureRating: map['avgInfrastructureRating'],
      isFeatured: map['isFeatured'],
      published: map['published'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      reviews: List<dynamic>.from(map['reviews'].map((x) => x)),
      isFavorite: map['isFavorite'],
      detailsModalId: map['detailsModalId'],
    );
  }
}

class City {
  String id;
  String country;
  String state;
  String city;
  String icon;

  City({
    required this.id,
    required this.country,
    required this.state,
    required this.city,
    required this.icon,
  });

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      id: map['_id'],
      country: map['country'],
      state: map['state'],
      city: map['city'],
      icon: map['icon'],
    );
  }
}

class Classification {
  String id;
  String name;
  String classificationId;
  String icon;

  Classification({
    required this.id,
    required this.name,
    required this.classificationId,
    required this.icon,
  });

  factory Classification.fromMap(Map<String, dynamic> map) {
    return Classification(
      id: map['_id'],
      name: map['name'],
      classificationId: map['id'],
      icon: map['icon'],
    );
  }
}

class Slug {
  String id;
  String slug;
  String formattedText;
  SlugMetaData slugMetaData;
  String slugJsonSchema;
  bool isHomepageSlug;
  Filters filters;
  String slugType;
  int v;
  String slugId;

  Slug({
    required this.id,
    required this.slug,
    required this.formattedText,
    required this.slugMetaData,
    required this.slugJsonSchema,
    required this.isHomepageSlug,
    required this.filters,
    required this.slugType,
    required this.v,
    required this.slugId,
  });

  factory Slug.fromMap(Map<String, dynamic> map) {
    return Slug(
      id: map['_id'],
      slug: map['slug'],
      formattedText: map['formattedText'],
      slugMetaData: SlugMetaData.fromMap(map['slugMetaData']),
      slugJsonSchema: map['slugJsonSchema'],
      isHomepageSlug: map['isHomepageSlug'],
      filters: Filters.fromMap(map['filters']),
      slugType: map['slugType'],
      v: map['__v'],
      slugId: map['id'],
    );
  }
}

class Filters {
  String school;
  String id;
  String filtersId;

  Filters({
    required this.school,
    required this.id,
    required this.filtersId,
  });

  factory Filters.fromMap(Map<String, dynamic> map) {
    return Filters(
      school: map['school'],
      id: map['_id'],
      filtersId: map['id'],
    );
  }
}

class SlugMetaData {
  String title;

  SlugMetaData({
    required this.title,
  });

  factory SlugMetaData.fromMap(Map<String, dynamic> map) {
    return SlugMetaData(
      title: map['title'],
    );
  }
}
