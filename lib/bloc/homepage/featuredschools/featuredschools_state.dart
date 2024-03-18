
import 'package:edhippo/modal/FeaturedSchoolsmodal/featuredSchools.dart';
import 'package:edhippo/utils/enums.dart';
import 'package:equatable/equatable.dart';

 class FeaturedSchoolsState extends Equatable{
  final DataStatus dataStatus;
  final List<FeaturedSchools> featuredSchoolsList;
  final String message;

  const FeaturedSchoolsState({ this.dataStatus=DataStatus.loading,
    this.featuredSchoolsList= const <FeaturedSchools>[],
  this.message=''});

  FeaturedSchoolsState copyWith({ DataStatus? dataStatus,
    List<FeaturedSchools>? featuredSchoolsList,
    String? message
  }){

    return FeaturedSchoolsState(
      dataStatus: dataStatus ?? this.dataStatus,
      featuredSchoolsList:  featuredSchoolsList ?? this.featuredSchoolsList,
      message:  message ?? this.message
    );
  }

  @override
  List<Object> get props=>[dataStatus,featuredSchoolsList,message];
}

