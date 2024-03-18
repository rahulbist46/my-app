import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edhippo/bloc/filter_page/school_board/school_board_bloc.dart';
import 'package:edhippo/bloc/filter_page/school_board/school_board_state.dart';
import 'package:edhippo/modal/school_board/school_board.dart';
import 'package:edhippo/ui_halper/util_textstyle.dart';
import '../../ui_halper/util_colore.dart';
import '../../utils/enums.dart';

Widget SchoolBoardData() {
  return SizedBox(
    height: 100,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'School Board',
          style: headingText20(fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 60, // Set the desired height for the row
          child: BlocBuilder<SchoolBoardBloc, SchoolBoardState>(
            builder: (context, state) {
              switch (state.dataStatus) {
                case DataStatus.loading:
                  return const Center(child: CircularProgressIndicator());
                case DataStatus.failure:
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(state.message.toString()),
                        // Add a retry button or other UI elements as needed
                      ],
                    ),
                  );
                case DataStatus.success:
                  if (kDebugMode) {
                    print('Featured schools list: ${state.schoolBoardlList}');
                  }
                  return ListView.builder(

                    scrollDirection: Axis.horizontal,
                    itemCount: state.schoolBoardlList.length,
                    itemBuilder: (context, index) {
                      final schoolBoard = state.schoolBoardlList[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: SchoolBoardCard(schoolBoard: schoolBoard),
                      );
                    },
                  );
                default:
                  return const Center(child: Text('Unknown state'));
              }
            },
          ),
        ),
      ],
    ),
  );
}

class SchoolBoardCard extends StatelessWidget {
  final SchoolBoard schoolBoard;

  const SchoolBoardCard({super.key, required this.schoolBoard});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('Displayed school type: ${schoolBoard.name}');
    }
    return Container(
      height: 50,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: bgColor1(),
      ),
      child: Center(
        child: Text(
          schoolBoard.name,
         ),
        ),

    );
  }
}
