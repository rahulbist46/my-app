import 'package:edhippo/bloc/searchpage/school_search/schoolsearch_bloc.dart';
import 'package:edhippo/bloc/searchpage/school_search/schoolsearch_state.dart';
import 'package:edhippo/modal/search_school/search_school_modal.dart';
import 'package:edhippo/ui_halper/util_textstyle.dart';
import 'package:edhippo/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: state.searchSchoolsList.length,
                      itemBuilder: (context, index) {
                        final name = state.searchSchoolsList[index];
                        return SchoolCard(searchSchool: name);
                      },
                    );
                  default:
                    return const Center(child: Text('Unknown state'));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SchoolCard extends StatelessWidget {
  final SearchSchool searchSchool;

  const SchoolCard({Key? key, required this.searchSchool}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xffEFF6FF),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 185,
              height: 150,
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
                        backgroundColor: Colors.red,
                        child: Icon(
                          searchSchool.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          size: 20,
                          color: Colors.white,
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
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      searchSchool.name,
                      style: bodyText11(),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
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
                    const SizedBox(height: 5),
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
            ),
          ],
        ),
      ),
    );
  }
}
