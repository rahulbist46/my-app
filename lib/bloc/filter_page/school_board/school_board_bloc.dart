import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'school_board_event.dart';
part 'school_board_state.dart';

class SchoolBoardBloc extends Bloc<SchoolBoardEvent, SchoolBoardState> {
  SchoolBoardBloc() : super(SchoolBoardInitial()) {
    on<SchoolBoardEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
