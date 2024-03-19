import 'package:edhippo/ui_halper/util_colore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edhippo/bloc/filter_page/classification/classification_bloc.dart';
import 'package:edhippo/bloc/filter_page/classification/classification_state.dart';
import 'package:edhippo/modal/classification/classification_modal.dart';
import 'package:edhippo/ui_halper/util_textstyle.dart';
import '../../utils/enums.dart';

// ignore: non_constant_identifier_names
Widget ClassificationsData() {
  return SizedBox(
    height: 100,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'School classifications',
          style: headingText20(fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 60, // Set the desired height for the row
          child: BlocBuilder<SchoolClassificationBloc, SchoolClassificationState>(
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
                    print('Featured schools list: ${state.schoolClassificationList}');
                  }

                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.schoolClassificationList.length,
                    itemBuilder: (context, index) {
                      final classification = state.schoolClassificationList[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ClassificationsCard(classification: classification),
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

class ClassificationsCard extends StatelessWidget {
  final SchoolClassification classification;

  const ClassificationsCard({super.key, required this.classification});

  @override
  Widget build(BuildContext context) {


    return Container(
      height: 50,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: bgColor1(),
      ),
      child: Center(
        child: Text(
          classification.name,

        ),
      ),
    );
  }
}
