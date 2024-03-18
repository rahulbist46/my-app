import 'package:bloc/bloc.dart';
import 'package:edhippo/bloc/filter_page/school_board/school_board_event.dart';
import 'package:edhippo/bloc/filter_page/school_board/school_board_state.dart';
import 'package:edhippo/modal/school_board/school_board.dart';
import 'package:flutter/foundation.dart';

import '../../../repository/school_board/schoolboard_repo.dart';
import '../../../utils/enums.dart';

class SchoolBoardBloc extends Bloc<SchoolBoardEvent, SchoolBoardState> {
  SchoolBoardRepository schoolBoardRepository=SchoolBoardRepository();

  SchoolBoardBloc() : super(const SchoolBoardState()) {
    on<FetchSchoolBoardData>(_fetchSchoolBoardData);
  }

  void _fetchSchoolBoardData(
      FetchSchoolBoardData event,
      Emitter<SchoolBoardState> emit,
      ) async {
    try {
      List<SchoolBoard> value =
      await schoolBoardRepository.fetchSchoolBoardApi();

      if (value.isNotEmpty) {
        emit(state.copyWith(
          dataStatus: DataStatus.success,
          message: 'Success',
          schoolBoardlList: value,
        ));
      } else {
        emit(state.copyWith(
          dataStatus: DataStatus.failure,
          message: 'Empty list received',
        ));
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching search schools: $error');
      }
    }
  }
}
