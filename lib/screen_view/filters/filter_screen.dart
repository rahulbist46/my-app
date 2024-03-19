import 'package:edhippo/screen_view/filters/classificitions.dart';
import 'package:edhippo/screen_view/filters/school_board.dart';
import 'package:edhippo/screen_view/filters/school_types.dart';
import 'package:edhippo/ui_halper/util_colore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/filter_page/classification/classification_bloc.dart';
import '../../bloc/filter_page/classification/classification_event.dart';
import '../../bloc/filter_page/school_board/school_board_bloc.dart';
import '../../bloc/filter_page/school_board/school_board_event.dart';
import '../../bloc/homepage/category/category_bloc.dart';
import '../../bloc/homepage/category/category_event.dart';

import '../../ui_halper/util_textstyle.dart';
import 'filter_scarch.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool featuredSchoolsEnabled = false; // Checkbox state variable
  RangeValues _sliderValues = const RangeValues(1000, 200000);

  @override
  void initState() {
    super.initState();

    // Fetch initial data when the screen is first loaded
    context.read<CategoryBloc>().add(FetchCategoryEvent());
    context.read<SchoolClassificationBloc>().add(FetchClassificationStateData());
    context.read<SchoolBoardBloc>().add(FetchSchoolBoardData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading:  CircleAvatar(
          radius: 15,
          backgroundColor: bgColor1(),
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        actions: [
          Container(
            height: 40,
          decoration: BoxDecoration(
            color: bgColor1(),
            borderRadius: BorderRadius.circular(8),
          ),
            child: const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Clear All',
                    style: TextStyle(color: Colors.black)),
              ),
            ),
          )
        ],
        title: const Center(
          child: Text('Apply Filters '),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FilterSearch(),
            const SizedBox(
              height: 15,
            ),
            Text('Search your dream school',
                style: headingText20(fontWeight: FontWeight.w500)),
            const SizedBox(height: 10,),
            Text('Fees Range',style: headingText16(fontWeight: FontWeight.w500),),
            SizedBox(
              height: 35, // Set a fixed height for the container
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: bgColor1(), // Use your color with opacity
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(Icons.currency_rupee, size: 15),
                          Text('${_sliderValues.start.toInt()}'), // Display minimum value
                        ],
                      ),
                    ),
                  ),
                  RangeSlider(
                    activeColor: greenColor().withOpacity(0.9),
                    inactiveColor: greenColor().withOpacity(0.6),
                    values: _sliderValues,
                    min: 1000.00,
                    max: 200000.0,
                    divisions: 200, // Increase divisions for finer steps
                    labels: RangeLabels(
                      '${_sliderValues.start.toInt()}',
                      '${_sliderValues.end.toInt()}',
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        _sliderValues = values;
                      });
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: bgColor1(), // Use your color with opacity
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(Icons.currency_rupee, size: 15),
                          const SizedBox(width: 5),
                          Text('${_sliderValues.end.toInt()}'), // Display maximum value
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),



            const SizedBox(
              height: 15,
            ),
            SchoolBoardData(),
            const SizedBox(height: 15),
            ClassificationsData(),
            const SizedBox(
              height: 15,
            ),
            schoolTypeData(),
            Row(
              children: [
                Checkbox(
                  value: featuredSchoolsEnabled,
                  onChanged: (value) {
                    setState(() {
                      featuredSchoolsEnabled =
                          value ?? true; // Set checkbox state
                    });
                  },
                ),
                const Text('Featured Schools')
              ],
            ),
            Center(
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  color: greenColor(),
                  borderRadius: BorderRadius.circular(11),
                ),
                child:  Center(child: Text('Apply Filters',style: bodyText14(color: whiteColor()),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
