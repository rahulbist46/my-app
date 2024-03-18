import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'classification_event.dart';
part 'classification_state.dart';

class ClassificationBloc extends Bloc<ClassificationEvent, ClassificationState> {
  ClassificationBloc() : super(ClassificationInitial()) {
    on<ClassificationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
