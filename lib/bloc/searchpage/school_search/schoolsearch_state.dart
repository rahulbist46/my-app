
 import 'package:edhippo/modal/search_school/search_school_modal.dart';
import 'package:edhippo/utils/enums.dart';
import 'package:equatable/equatable.dart';

class SchoolSearchState extends Equatable{

  final DataStatus dataStatus;
  final List<SearchSchool>searchSchoolsList;
  final String message;

  const SchoolSearchState(
      {this.dataStatus=DataStatus.loading,
        this.searchSchoolsList=const<SearchSchool>[],
        this.message=''});


  SchoolSearchState copyWith({
    DataStatus? dataStatus,
    List<SearchSchool> ?searchSchoolsList,
    String? message
}){
    return SchoolSearchState(
    dataStatus: dataStatus ?? this.dataStatus,
    searchSchoolsList: searchSchoolsList ?? this.searchSchoolsList,
    message: message ?? this.message
    );
 }
  @override
  // TODO: implement props
  List<Object?> get props => [dataStatus,searchSchoolsList,message];





}


