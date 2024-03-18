
import 'package:equatable/equatable.dart';

abstract class SchoolSearchEvent extends Equatable{

  const SchoolSearchEvent();
  @override
  List<Object> get props=>[];

}
 class FetchSchoolSearchEvent extends SchoolSearchEvent{}

class SearchItem extends SchoolSearchEvent{

  final  String stSearch;
  const SearchItem( this.stSearch);

}