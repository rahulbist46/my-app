

import 'package:edhippo/modal/classification/classification_modal.dart';
import 'package:equatable/equatable.dart';

import '../../../utils/enums.dart';

class SchoolClassificationState extends  Equatable{

  final DataStatus dataStatus;
  final List<SchoolClassification> schoolClassificationList;
  final String message;


  const SchoolClassificationState({this. dataStatus=DataStatus.loading,
    this. schoolClassificationList=const[],
    this.message='',
  });

  SchoolClassificationState copyWith({DataStatus? dataStatus,
    List<SchoolClassification>? schoolClassificationList,
    String? message,
  }){

    return SchoolClassificationState(
      dataStatus:dataStatus?? this.dataStatus ,
      schoolClassificationList: schoolClassificationList?? this.schoolClassificationList,
      message: message ?? this.message,
    );
  }



  @override
  // TODO: implement props
  List<Object?> get props => [dataStatus,schoolClassificationList,message];
}
