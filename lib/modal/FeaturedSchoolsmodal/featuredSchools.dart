import '../category_modal/school_types.dart';
import 'package:edhippo/modal/city_modal/cities.dart';
import 'package:edhippo/modal/classification/classification_modal.dart';
import 'package:edhippo/modal/facility/facility_modal.dart';
import 'package:edhippo/modal/review/reviewmodel.dart';
import 'package:edhippo/modal/school_board/school_board.dart';

class  FeaturedSchools {

  final String id;
  final String name;
  final String contactNumber;
  final String mail;
  final String website;
  final String classFrom;
  final String classTo;
  final num establishmentYear;
  final num minFees;
  final num maxFees;
  final num avgRating;
  final bool isFeatured;
  final bool isFavorite;
  final String city;
  final SchoolClassification classification;
  final List<String> images;
  final List<SchoolBoard> schoolBoards;
  final List<SchoolType> types;
  final String? chairman;
  final String? medium;
  final String? admissionStart;
  final String? admissionEnd;
  final String? about;
  final String? createdAt;
  final String? updatedAt;
  final num? avgAcademicsRating;
  final num? avgAdmissionRating;
  final num? avgExtracurricularRating;
  final num? avgInfrastructureRating;
  final List<Facility>? facilities;
  final List<ReviewModel>? reviews;
  // final MyReview? myReview;
  // final int totalReviews;

  FeaturedSchools({
    required this.id,
    required this.name,
    required this.contactNumber,
    required this.mail,
    required this.website,
    required this.classFrom,
    required this.classTo,
    required this.establishmentYear,
    required this.minFees,
    required this.maxFees,
    required this.avgRating,
    required this.isFeatured,
    required this.isFavorite,
    required this.city,
    required this.classification,
    required this.images,
    required this.schoolBoards,
    required this.types,
    this.chairman,
    this.medium,
    this.admissionStart,
    this.admissionEnd,
    this.about,
    this.createdAt,
    this.updatedAt,
    this.avgAcademicsRating,
    this.avgAdmissionRating,
    this.avgExtracurricularRating,
    this.avgInfrastructureRating,
    this.facilities,
    this.reviews,
  });

  factory FeaturedSchools.fromMap(Map<String, dynamic> json) {
    return FeaturedSchools(
      id: json['_id'],
      name: json['name'],
      contactNumber: json['contactNumber'],
      mail: json['mail'],
      website: json['website'],
      classFrom: json['classFrom'],
      classTo: json['classTo'],
      establishmentYear: json['establishmentYear'],
      minFees: json['minFees'],
      maxFees: json['maxFees'],
      avgRating: json['avgRating'] ?? 0,
      isFeatured: json['isFeatured'],
      isFavorite: json['isFavorite'],
      city: /* CityModel.fromMap( */ json['city']['city'] ?? "",
      classification: SchoolClassification.fromMap(json['classification']),
      images: json['images'].cast<String>(),
      schoolBoards: json['schoolBoards'] == null
          ? <SchoolBoard>[]
          : List<SchoolBoard>.from(
        json['schoolBoards'].map((dynamic x) => SchoolBoard.fromMap(x)),
      ),
      types: json['type'] == null
          ? <SchoolType>[]
          : List<SchoolType>.from(
        json['type'].map((dynamic x) => SchoolType.fromMap(x)),
      ),
      chairman: json['chairman'],
      medium: json['medium'],
      admissionStart: json['admissionStart'],
      admissionEnd: json['admissionEnd'],
      about: json['about'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      avgAcademicsRating: json['avgAcademicsRating'],
      avgAdmissionRating: json['avgAddmissionRating'],
      avgExtracurricularRating: json['avgExtracurriclarRating'],
      avgInfrastructureRating: json['avgInfrastructureRating'],
      facilities: json['facilities'] == null
          ? <Facility>[]
          : List<Facility>.from(
        json['facilities'].map((dynamic x) => Facility.fromMap(x)),
      ),
    //  reviews: json['reviews'] != null
       //   ? List<ReviewModel>.from(
     //   json['reviews'].map((dynamic x) => ReviewModel.fromMap(x)),
    //  )
    //     : null,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'name': name,
      'contactNumber': contactNumber,
      'mail': mail,
      'website': website,
      'classFrom': classFrom,
      'classTo': classTo,
      'establishmentYear': establishmentYear,
      'minFees': minFees,
      'maxFees': maxFees,
      'avgRating': avgRating,
      'isFeatured': isFeatured,
      'isFavorite': isFavorite,
      'city': city,
      'classification': classification.toMap(),
      'images': images,
      'schoolBoards': List<dynamic>.from(
        schoolBoards.map((SchoolBoard x) => x.toMap()),
      ),
      'type': List<dynamic>.from(
        types.map((SchoolType x) => x.toMap()),
      ),
      'chairman': chairman,
      'medium': medium,
      'admissionStart': admissionStart,
      'admissionEnd': admissionEnd,
      'about': about,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'avgAcademicsRating': avgAcademicsRating,
      'avgAddmissionRating': avgAdmissionRating,
      'avgExtracurriclarRating': avgExtracurricularRating,
      'avgInfrastructureRating': avgInfrastructureRating,
      'facilities': facilities != null
          ? List<dynamic>.from(
        facilities!.map((Facility x) => x.toMap()),
      )
          : null,
     // 'reviews': reviews != null
      //    ? List<dynamic>.from(
     //   reviews!.map((ReviewModel x) => x.toMap()),
    //  )
      //    : null,
    };
  }

  FeaturedSchools copyWith({
    String? id,
    String? name,
    String? contactNumber,
    String? mail,
    String? website,
    String? classFrom,
    String? classTo,
    num? establishmentYear,
    num? minFees,
    num? maxFees,
    num? avgRating,
    bool? isFeatured,
    bool? isFavorite,
    CitiesModel? city,
    SchoolClassification? classification,
    List<String>? images,
    List<SchoolBoard>? schoolBoards,
    List<SchoolType>? types,
    String? chairman,
    String? medium,
    String? admissionStart,
    String? admissionEnd,
    String? about,
    String? createdAt,
    String? updatedAt,
    num? avgAcademicsRating,
    num? avgAdmissionRating,
    num? avgExtracurricularRating,
    num? avgInfrastructureRating,
    List<Facility>? facilities,
    List<ReviewModel>? reviews,
    // MyReview? myReview,
    // int? totalReviews,
  }) {
    return FeaturedSchools(
      id: id ?? this.id,
      name: name ?? this.name,
      contactNumber: contactNumber ?? this.contactNumber,
      mail: mail ?? this.mail,
      website: website ?? this.website,
      classFrom: classFrom ?? this.classFrom,
      classTo: classTo ?? this.classTo,
      establishmentYear: establishmentYear ?? this.establishmentYear,
      minFees: minFees ?? this.minFees,
      maxFees: maxFees ?? this.maxFees,
      avgRating: avgRating ?? this.avgRating,
      isFeatured: isFeatured ?? this.isFeatured,
      isFavorite: isFavorite ?? this.isFavorite,
      city: city?.city ?? this.city,
      classification: classification ?? this.classification,
      images: images ?? this.images,
      schoolBoards: schoolBoards ?? this.schoolBoards,
      types: types ?? this.types,
      chairman: chairman ?? this.chairman,
      medium: medium ?? this.medium,
      admissionStart: admissionStart ?? this.admissionStart,
      admissionEnd: admissionEnd ?? this.admissionEnd,
      about: about ?? this.about,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      avgAcademicsRating: avgAcademicsRating ?? this.avgAcademicsRating,
      avgAdmissionRating: avgAdmissionRating ?? this.avgAdmissionRating,
      avgExtracurricularRating:
      avgExtracurricularRating ?? this.avgExtracurricularRating,
      avgInfrastructureRating:
      avgInfrastructureRating ?? this.avgInfrastructureRating,
      facilities: facilities ?? this.facilities,
      reviews: reviews ?? this.reviews,
    );
  }
}
