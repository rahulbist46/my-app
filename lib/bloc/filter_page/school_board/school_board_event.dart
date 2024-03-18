
import 'package:equatable/equatable.dart';

sealed class SchoolBoardEvent extends Equatable{

  const SchoolBoardEvent();

  @override
  List<Object>get props=>[];
}


class FetchSchoolBoardData extends SchoolBoardEvent{}