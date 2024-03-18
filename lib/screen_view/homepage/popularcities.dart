import 'package:edhippo/bloc/homepage/city/cities_bloc.dart';
import 'package:edhippo/bloc/homepage/city/cities_state.dart';
import 'package:edhippo/modal/city_modal/cities.dart';
import 'package:edhippo/ui_halper/util_colore.dart';
import 'package:edhippo/ui_halper/util_textstyle.dart';
import 'package:edhippo/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

popularCities() {
  return SizedBox(
      height: 150,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Text(
          'Popular Cities',
          style: headingText24(),
        ),
        SizedBox(
          height: 110, // Set the desired height for the row
          child: BlocBuilder<CitiesBloc, CitiesState>(
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
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.citiesList.length,
                    itemBuilder: (context, index) {
                      final city = state.citiesList[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: PopularCityCard(citiesModel: city),
                      );
                    },
                  );
                default:
                  return const Center(child: Text('Unknown state'));
              }
            },
          ),
        )
      ]));
}

class PopularCityCard extends StatelessWidget {
  final CitiesModel citiesModel;

  const PopularCityCard({super.key, required this.citiesModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: bgColor(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(citiesModel.icon),
                backgroundColor: bgColor(),

              ),
              const SizedBox(width: 8,height: 8,),
              Text(citiesModel.city),
            ],
          ),
        ),
      ),
    );
  }
}
