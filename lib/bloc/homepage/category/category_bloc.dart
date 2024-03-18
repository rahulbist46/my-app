
import 'package:edhippo/bloc/homepage/category/category_event.dart';
import 'package:edhippo/bloc/homepage/category/category_state.dart';
import 'package:edhippo/repository/category_repo/schooltype_repository.dart';
import 'package:edhippo/utils/enums.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../modal/category_modal/school_types.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {

  SchoolTypeRepository schoolTypeRepository = SchoolTypeRepository();


  CategoryBloc() : super(const CategoryState()) {
    on<FetchCategoryEvent>(_fetchCategoryEvent);
  }

  void _fetchCategoryEvent(FetchCategoryEvent event,
      Emitter<CategoryState> emit) async {
    try {
      List<SchoolType> value = await schoolTypeRepository
          .fetchSchoolTypeData();

      if (value.isNotEmpty) {
        emit(state.copyWith(
          dataStatus: DataStatus.success,
          message: 'success',
          schoolList: value,
        ));
      } else {
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