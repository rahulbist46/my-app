import 'package:edhippo/bloc/homepage/category/category_state.dart';
import 'package:edhippo/modal/category_modal/school_types.dart';
import 'package:edhippo/ui_halper/util_colore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/homepage/category/category_bloc.dart';

import '../../ui_halper/util_textstyle.dart';
import '../../utils/enums.dart';

Widget schoolTypeData() {
  return SizedBox(
    height: 120,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'School Types',
          style: headingText20(fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 60, // Set the desired height for the row
          child: BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (kDebugMode) {
                print('Current state: $state');
              } // Print the current state
              switch (state.dataStatus) {
                case DataStatus.loading:
                  return const Center(child: CircularProgressIndicator());
                case DataStatus.failure:
                  if (kDebugMode) {
                    print('Error message: ${state.message}');
                  } // Print the error message
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
                    print('Featured schools list: ${state.schoolList}');
                  }
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.schoolList.length,
                    itemBuilder: (context, index) {
                      final name = state.schoolList[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: SchoolTypeCard(schoolType: name),
                      );
                    },
                  );
                default:
                  return const Center(child: Text('Unknown state'));
              }
            },
          ),
        )
      ],
    ),
  );
}

class SchoolTypeCard extends StatelessWidget {
  final SchoolType schoolType;

  const SchoolTypeCard({super.key, required this.schoolType});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('Displayed school type: ${schoolType.name}');
    } // Print displayed school type
    return Container(
      height: 60,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: bgColor1(),
      ),
      child: Center(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(schoolType.name),
      )),
    );
  }
}
