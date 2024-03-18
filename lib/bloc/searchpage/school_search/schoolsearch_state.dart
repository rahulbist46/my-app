import 'package:edhippo/modal/search_school/search_school_modal.dart';
import 'package:edhippo/utils/enums.dart';
import 'package:equatable/equatable.dart';

class SchoolSearchState extends Equatable{

  final DataStatus dataStatus;
  final List<SearchSchool> searchSchoolsList;
  final List<SearchSchool> temSearchSchoolsList;
  final String message;
  final String searchMessage;

  const SchoolSearchState({
    this.dataStatus = DataStatus.loading,
    this.searchSchoolsList = const <SearchSchool>[],
    this.temSearchSchoolsList = const <SearchSchool>[],
    this.message = '',
    this.searchMessage = '',
  });

  SchoolSearchState copyWith({
    DataStatus? dataStatus,
    List<SearchSchool>? searchSchoolsList,
    List<SearchSchool>? temSearchSchoolsList,
    String? message,
    String? searchMessage,
  }) {
    return SchoolSearchState(
      dataStatus: dataStatus ?? this.dataStatus,
      searchSchoolsList: searchSchoolsList ?? this.searchSchoolsList,
      temSearchSchoolsList: temSearchSchoolsList ?? this.temSearchSchoolsList,
      message: message ?? this.message,
      searchMessage: searchMessage ?? this.searchMessage,
    );
  }

  @override
  List<Object?> get props => [dataStatus, searchSchoolsList, temSearchSchoolsList, message, searchMessage];
}
