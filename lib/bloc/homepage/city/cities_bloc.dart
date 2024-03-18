



import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:edhippo/bloc/homepage/city/cities_event.dart';
import 'package:edhippo/bloc/homepage/city/cities_state.dart';
import 'package:edhippo/modal/city_modal/cities.dart';
import 'package:edhippo/repository/popular_city/cities_repository.dart';
import 'package:edhippo/utils/enums.dart';


class CitiesBloc extends Bloc<CitiesEvent,CitiesState> {

  final CitiesRepository citiesRepository = CitiesRepository();

  CitiesBloc() : super(const CitiesState()) {
    on<FetchCitiesEvent>(_fetchCitiesEvent);
  }

  void _fetchCitiesEvent(FetchCitiesEvent event,
      Emitter<CitiesState> emit) async {
    await citiesRepository.fetchApi().then((value) {
      if (value.isNotEmpty) {
        emit(state.copyWith(
          dataStatus: DataStatus.success,
          message: 'success',
          citiesList: value,
        ));
      } else {
        // Handle empty list case
        emit(state.copyWith(
          dataStatus: DataStatus.failure,
          message: 'Empty list received',
        ));
      }
    } as FutureOr Function(List<CitiesModel> value)).catchError((error,
        stackTrace) {
      // ... error handling
    });
  }
}