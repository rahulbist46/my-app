import 'package:edhippo/modal/cities.dart';
import 'package:edhippo/utils/enums.dart';
import 'package:equatable/equatable.dart';

class CitiesState extends Equatable {
  final DataStatus dataStatus;
  final List<CitiesModel> citiesList;
  final String message;


  const CitiesState({
    this.dataStatus = DataStatus.loading,
    this.citiesList = const <CitiesModel>[],
    this.message = '',

  });

  CitiesState copyWith(
      {DataStatus? dataStatus,
        List<CitiesModel>? citiesList,

        String? message,
        }) {
    return CitiesState(
      dataStatus: dataStatus ?? this.dataStatus,
      citiesList: citiesList ?? this.citiesList,
      message: message ?? this.message,

    );
  }

  @override
  List<Object> get props =>
      [dataStatus, citiesList, message];
}
