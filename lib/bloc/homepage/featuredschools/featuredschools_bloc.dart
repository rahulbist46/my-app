

import 'package:edhippo/bloc/homepage/featuredschools/featuredschools_event.dart';
import 'package:edhippo/bloc/homepage/featuredschools/featuredschools_state.dart';
import 'package:edhippo/modal/FeaturedSchoolsmodal/featuredSchools.dart';
import 'package:edhippo/repository/featuredschools_repo/featuredschools.dart';
import 'package:edhippo/utils/enums.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureSchoolsBloc extends Bloc<FeaturedSchoolsEvent, FeaturedSchoolsState> {
  FeaturedSchoolsRepository featuredSchoolsRepository=FeaturedSchoolsRepository();


  FeatureSchoolsBloc():super(const FeaturedSchoolsState()){
    on<FetchFeaturedSchoolsEvent>(_fetchFeaturedSchoolsEvent);
  }

  void _fetchFeaturedSchoolsEvent(
      FetchFeaturedSchoolsEvent event,Emitter<FeaturedSchoolsState>emit)async{

    try {

      List<FeaturedSchools> value =await featuredSchoolsRepository.fetchFeaturedSchoolsData();

      if(value.isNotEmpty){

        emit(state.copyWith(dataStatus: DataStatus.success,
        message: 'success',
          featuredSchoolsList: value
        ));


      }else {
        emit(state.copyWith(
          dataStatus: DataStatus.failure,
          message: 'Empty list received',
        ));
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching school types: $error');
      }
      // Additional error handling logic if needed
    }
  }
}