
 import 'package:edhippo/modal/category_modal/school_types.dart';
import 'package:edhippo/utils/enums.dart';
import 'package:equatable/equatable.dart';

class CategoryState extends Equatable {
  final DataStatus dataStatus;
  final List<SchoolType> schoolList;
  final String message;


  const CategoryState({
  this.dataStatus = DataStatus.loading,
  this.schoolList = const <SchoolType>[],
  this.message = '',

  });
  CategoryState copyWith({ DataStatus? dataStatus,
    List<SchoolType>? schoolList,
    String? message}){

    return CategoryState(
      dataStatus: dataStatus??this.dataStatus ,
      schoolList: schoolList ?? this.schoolList,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props =>
  [dataStatus, schoolList, message];
  }
