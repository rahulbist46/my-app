import 'package:bloc/bloc.dart';
import 'package:edhippo/modal/school_details/details_modal.dart';
import 'package:flutter/foundation.dart';
import '../../repository/schooldetails/details_repo.dart';
import '../../utils/enums.dart';
import 'details_event.dart';
import 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {

  SchoolDetailsRepository schoolDetailsRepository = SchoolDetailsRepository();

  DetailsBloc() : super(const DetailsState()) {
    on<FetchDetailsData>(_fetchDetailsData);
  }

  void _fetchDetailsData(FetchDetailsData event,
      Emitter<DetailsState> emit) async {
    try {
      // Fetch details data for the specific school ID
      List<DetailsModal> value = await schoolDetailsRepository.fetchDetailApi(
          event.schoolId as String);

      if (value.isNotEmpty) {
        emit(state.copyWith(
          dataStatus: DataStatus.success,
          message: 'success',
          detailsList: value,
        ));
      } else {
        emit(state.copyWith(
          dataStatus: DataStatus.failure,
          message: 'Empty list received',
        ));
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching school details: $error');
      }
      // Additional error handling logic if needed
    }
  }
}