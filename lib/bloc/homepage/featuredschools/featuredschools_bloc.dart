import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'featuredschools_event.dart';
part 'featuredschools_state.dart';

class FeaturedschoolsBloc extends Bloc<FeaturedschoolsEvent, FeaturedschoolsState> {
  FeaturedschoolsBloc() : super(FeaturedschoolsInitial()) {
    on<FeaturedschoolsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
