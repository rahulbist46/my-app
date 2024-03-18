
import 'package:edhippo/ui_halper/util_colore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edhippo/bloc/searchpage/school_search/schoolsearch_bloc.dart';
import 'package:edhippo/bloc/searchpage/school_search/schoolsearch_state.dart';
import 'package:edhippo/modal/search_school/search_school_modal.dart';
import 'package:edhippo/ui_halper/util_textstyle.dart';
import 'package:edhippo/utils/enums.dart';


Widget searchCard() {
  return SingleChildScrollView(
    child: SizedBox(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Featured Schools',
              style: headingText24(),
            ),
            BlocBuilder<SchoolSearchBloc, SchoolSearchState>(
              builder: (context, state) {
                switch (state.dataStatus) {
                  case DataStatus.loading:
                    return const Center(child: CircularProgressIndicator());
                  case DataStatus.failure:
                    return Center(
                      child: Column(
                        children: [
                          Text(state.message.toString()),
                        ],
                      ),
                    );
                  case DataStatus.success:
                    return state.searchMessage.isNotEmpty ? Center(child: Text(state.searchMessage.toString())) :
                    Column(
                      children: [
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(), // Disable GridView scrolling
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 1.0,
                            mainAxisSpacing: 8.0,
                            childAspectRatio: 0.8,
                          ),
                          itemCount: state.temSearchSchoolsList.isEmpty ? state.searchSchoolsList.length : state.temSearchSchoolsList.length,
                          itemBuilder: (context, index) {
                            if (state.temSearchSchoolsList.isNotEmpty) {
                              final name = state.temSearchSchoolsList[index];
                              return ListTile(
                                title: SchoolCard(searchSchool: name),
                              );
                            } else {
                              final name = state.searchSchoolsList[index];
                              return ListTile(
                                title: SchoolCard(searchSchool: name),
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 16), // Adjust the height as needed
                      ],
                    );
                  default:
                    return const Center(child: Text('Unknown state'));
                }
              },
            ),
          ],
        ),
      ),
    ),
  );
}


class SchoolCard extends StatelessWidget {
  final SearchSchool searchSchool;

  const SchoolCard({super.key, required this.searchSchool});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xffEFF6FF),
      child: SizedBox(
        width: double.infinity,
        height: 300,// Adjust card width to fill available space
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity, // Adjust image width to fill available space
              height: 150, // Increase image height
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(searchSchool.images[0]),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 8,
                      right: 8,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: bgColor(),
                        child: Icon(
                          searchSchool.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          size: 20,
                          color: greenColor1(),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.all(4),
                        child: Text(
                          searchSchool.type[0].name,
                          style:
                          bodyText12(color: whiteColor()),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0), // Increase padding around text
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    searchSchool.name,
                    style: bodyText11(),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined, size: 15,),
                      const SizedBox(width: 8),
                      Text(
                        searchSchool.city.city,
                        style: bodyText11(),
                      ),
                      const Spacer(),
                      Text(
                        searchSchool.avgRating.toString(), // This line needs correction
                        style: bodyText11(),
                      ),
                      const Icon(Icons.star, color: Colors.yellow, size: 15,),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        searchSchool.classification.name,
                        style: bodyText11(),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${searchSchool.minFees}/y',
                        style: bodyText11(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}