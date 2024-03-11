import 'package:equatable/equatable.dart';

abstract class CitiesEvent extends Equatable {
  const CitiesEvent();


  @override
  List<Object?> get props => [];
}
class FetchCitiesEvent extends CitiesEvent {}