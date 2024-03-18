
import 'package:equatable/equatable.dart';

abstract class FeaturedSchoolsEvent extends Equatable{

  const FeaturedSchoolsEvent();
  @override
  List<Object>get props=>[];
}

class FetchFeaturedSchoolsEvent extends FeaturedSchoolsEvent{}
