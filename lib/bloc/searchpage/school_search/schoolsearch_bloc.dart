import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'schoolsearch_event.dart';
part 'schoolsearch_state.dart';

class SchoolsearchBloc extends Bloc<SchoolsearchEvent, SchoolsearchState> {
  SchoolsearchBloc() : super(SchoolsearchInitial()) {
    on<SchoolsearchEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
