import 'package:edhippo/utils/enums.dart';
import 'package:equatable/equatable.dart';

import '../../modal/school_details/details_modal.dart';

class DetailsState extends Equatable{
  final DataStatus dataStatus;
  final List<DetailsModal> detailsList;
  final String message;


  const DetailsState({
    this.dataStatus=DataStatus.loading,
    this.detailsList=const<DetailsModal>[],
    this.message=''
});

  DetailsState copyWith({
    DataStatus? dataStatus,
    List<DetailsModal>? detailsList,
    String? message
  }){
    return DetailsState(
    dataStatus: dataStatus ?? this.dataStatus,
    detailsList: detailsList ?? this.detailsList,
    message: message ?? this.message
    );
}

  @override
  // TODO: implement props
  List<Object?> get props => [dataStatus,detailsList,message];


}
