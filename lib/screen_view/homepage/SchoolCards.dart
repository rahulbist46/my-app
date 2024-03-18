import 'package:edhippo/bloc/homepage/featuredschools/featuredschools_bloc.dart';
import 'package:edhippo/bloc/homepage/featuredschools/featuredschools_state.dart';
import 'package:edhippo/modal/FeaturedSchoolsmodal/featuredSchools.dart';
import 'package:edhippo/ui_halper/util_colore.dart';
import 'package:edhippo/ui_halper/util_textstyle.dart';
import 'package:edhippo/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget schoolCards() {
  return SizedBox(

        height: 520,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
          'Featured Schools',
          style: headingText24(),
        ),
            BlocBuilder<FeatureSchoolsBloc, FeaturedSchoolsState>(
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
              itemCount: state.featuredSchoolsList.length,
              itemBuilder: (context, index) {
                final name = state.featuredSchoolsList[index];
                return SchoolCard(featuredSchools: name);
              },
            );
          default:
            return const Center(child: Text('Unknown state'));
        }
      },
    ),
    ]
  )
  );
}

class SchoolCard extends StatelessWidget {
  final FeaturedSchools featuredSchools;


  const SchoolCard({super.key, required this.featuredSchools, });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: bgColor(),
      child: SizedBox(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 173,
              height: 150,
              child: Container(
                decoration: BoxDecoration(
                  image:   DecorationImage(
                    image: NetworkImage(featuredSchools.images[0].toString()),
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
                        backgroundColor: bgColor(),
                        radius: 15,
                        child: Icon(
                          featuredSchools.isFavorite ? Icons.favorite : Icons.favorite_border,
                          size: 20,
                          color: Colors.red,
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
                        child: Text(featuredSchools.types[0].name,
                        style: bodyText12(),),

                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    featuredSchools.name,
                    style: bodyText14(),overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined,size: 10,),
                      const SizedBox(width: 1),
                      Text(featuredSchools.city,style: bodyText10(),),
                      const Spacer(),
                      Text(
                        featuredSchools.avgRating.toString(),
                        style: bodyText11(),
                      ),
                      const Icon(Icons.star, color: Colors.yellow,size: 15,),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(featuredSchools.classification.name,style: bodyText11(),),

                      Text(featuredSchools.maxFees.toString(),style: bodyText11(),), // Fee placeholder
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