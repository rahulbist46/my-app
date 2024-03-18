import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../../modal/classification/classification_modal.dart';
import '../../../repository/classification/classification_repo.dart';
import '../../../utils/enums.dart';
import 'classification_event.dart';
import 'classification_state.dart';

class SchoolClassificationBloc extends Bloc<SchoolClassificationEvent, SchoolClassificationState> {
  final SchoolBoardStateRepository schoolBoardStateRepository = SchoolBoardStateRepository();

  SchoolClassificationBloc() : super(const SchoolClassificationState()) {
    on<FetchClassificationStateData>(_fetchClassificationStateData);
  }

  void _fetchClassificationStateData(
      FetchClassificationStateData event,
      Emitter<SchoolClassificationState> emit,
      ) async {
    try {
      List<SchoolClassification> value = await schoolBoardStateRepository.schoolClassificationApi();

      if (value.isNotEmpty) {
        emit(state.copyWith(
          dataStatus: DataStatus.success,
          message: 'Success',
          schoolClassificationList: value,
        ));
      } else {
        emit(state.copyWith(
          dataStatus: DataStatus.failure,
          message: 'Empty list received',
        ));
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching school classifications: $error');
      }
    }
  }
}
