
 import 'package:edhippo/modal/school_board/school_board.dart';
import 'package:equatable/equatable.dart';

import '../../../utils/enums.dart';

class SchoolBoardState extends  Equatable{

  final DataStatus dataStatus;
  final List<SchoolBoard> schoolBoardlList;
  final String message;


  const SchoolBoardState({this. dataStatus=DataStatus.loading,
    this. schoolBoardlList=const[],
  this.message='',
  });

  SchoolBoardState copyWith({DataStatus? dataStatus,
    List<SchoolBoard>? schoolBoardlList,
    String? message,
  }){

    return SchoolBoardState(
    dataStatus:dataStatus?? this.dataStatus ,
    schoolBoardlList: schoolBoardlList?? this.schoolBoardlList,
    message: message ?? this.message,
    );
 }



  @override
  
  List<Object?> get props => [dataStatus,schoolBoardlList,message];
}
