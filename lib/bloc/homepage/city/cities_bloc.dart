



import 'package:bloc/bloc.dart';
import 'package:edhippo/bloc/homepage/city/cities_event.dart';
import 'package:edhippo/bloc/homepage/city/cities_state.dart';
import 'package:edhippo/repository/cities_repository.dart';
import 'package:edhippo/utils/enums.dart';
import 'package:flutter/foundation.dart';

class CitiesBloc extends Bloc<CitiesEvent,CitiesState>{

  final CitiesRepository citiesRepository=CitiesRepository();

  CitiesBloc(): super(const CitiesState()){
    on<FetchCitiesEvent>(_fetchCitiesEvent);

  }
  void _fetchCitiesEvent(FetchCitiesEvent event, Emitter<CitiesState> emit) async {
    await citiesRepository.fetchApi().then((value) {
      emit(state.copyWith(
        dataStatus: DataStatus
            .success, // Correct the status based on the success or failure
        message: 'success',
        citiesList: value,
      ));
    }).catchError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
      }
      if (kDebugMode) {
        print(stackTrace);
      }
      emit(state.copyWith(
        dataStatus: DataStatus.failure, // Update the state to error
        message: error.toString(),
      ));
    });
  }
}