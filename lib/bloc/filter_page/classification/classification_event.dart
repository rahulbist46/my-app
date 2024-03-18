
import 'package:equatable/equatable.dart';

sealed class SchoolClassificationEvent extends Equatable{

  const SchoolClassificationEvent();

  @override
  List<Object>get props=>[];
}


class FetchClassificationStateData extends SchoolClassificationEvent{}