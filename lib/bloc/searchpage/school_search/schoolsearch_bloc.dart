import 'package:edhippo/bloc/searchpage/school_search/schoolsearch_event.dart';
import 'package:edhippo/bloc/searchpage/school_search/schoolsearch_state.dart';
import 'package:edhippo/modal/search_school/search_school_modal.dart';
import 'package:edhippo/repository/school_search/schoolsearch_repo.dart';
import 'package:edhippo/utils/enums.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SchoolSearchBloc extends Bloc<SchoolSearchEvent, SchoolSearchState> {
  List<SearchSchool>temSearchSchoolsList=[];


  SchoolSearchRepository schoolSearchRepository=SchoolSearchRepository();

  SchoolSearchBloc()
      : super( const SchoolSearchState()) {
    on<FetchSchoolSearchEvent>(_fetchSchoolSearchEvent);
    on<SearchItem>(_filterList);
  }

  void _fetchSchoolSearchEvent(
      FetchSchoolSearchEvent event, Emitter<SchoolSearchState> emit) async {
    try {
      // Fetch search schools data from the repository
      List<SearchSchool> value =
      await schoolSearchRepository.fetchSearchSchoolsApi();

      if (value.isNotEmpty) {
        // Emit a success state with the fetched search schools data
        emit(state.copyWith(
          dataStatus: DataStatus.success,
          message: 'Success',
          searchSchoolsList: value,
        ));
      } else {
        // Emit a failure state with a message indicating an empty list
        emit(state.copyWith(
          dataStatus: DataStatus.failure,
          message: 'Empty list received',
        ));
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching search schools: $error');
      }
      // Additional error handling logic if needed
    }
  }


  void _filterList(SearchItem event, Emitter<SchoolSearchState> emit) async {
    if(event.stSearch.isEmpty){
      emit(state.copyWith(temSearchSchoolsList: [],searchMessage: ''));
    }else{
      temSearchSchoolsList = state.searchSchoolsList.where((element) => element.name.toString().toLowerCase().contains(event.stSearch.toLowerCase())).toList();


      if(temSearchSchoolsList.isEmpty){
        emit(state.copyWith(temSearchSchoolsList: temSearchSchoolsList,searchMessage: 'data not found'));

      }else{
        emit(state.copyWith(temSearchSchoolsList: temSearchSchoolsList));
      }
    }




  }
}