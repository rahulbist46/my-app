import 'package:equatable/equatable.dart';

abstract class DetailsEvent extends Equatable {
  const DetailsEvent();

  @override
  List<Object> get props => [];
}

class FetchDetailsData extends DetailsEvent {
  final int schoolId;

  const FetchDetailsData(this.schoolId);

  @override
  List<Object> get props => [schoolId];
}
