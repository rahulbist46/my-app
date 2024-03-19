import 'package:edhippo/bloc/homepage/category/category_bloc.dart';
import 'package:edhippo/bloc/homepage/category/category_event.dart';
import 'package:edhippo/bloc/homepage/city/cities_bloc.dart';
import 'package:edhippo/bloc/homepage/featuredschools/featuredschools_bloc.dart';
import 'package:edhippo/bloc/homepage/featuredschools/featuredschools_event.dart';
import 'package:edhippo/screen_view/homepage/SchoolCards.dart';
import 'package:edhippo/screen_view/homepage/categorysection.dart';
import 'package:edhippo/screen_view/homepage/greetingsection.dart';
import 'package:edhippo/screen_view/homepage/popularcities.dart';
import 'package:edhippo/screen_view/homepage/profilesection.dart';
import 'package:edhippo/ui_halper/util_colore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/homepage/city/cities_event.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

  void initState() {
    super.initState();

    _fetchCategories();
    _fetchCities();
    _featureSchools();
  }

  void _fetchCategories() {
    context.read<CategoryBloc>().add(FetchCategoryEvent());
  }

  void _fetchCities() {
    context.read<CitiesBloc>().add(FetchCitiesEvent());
  }

  void _featureSchools() {
    context.read<FeatureSchoolsBloc>().add(FetchFeaturedSchoolsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(11.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                profileSection(),
                const SizedBox(height: 15),
                greetingSection(),
                const SizedBox(height: 30),
                categorySection(),
                const SizedBox(height: 40),
                popularCities(),
                const SizedBox(height: 40),
                schoolCards(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: bgColor(),
        onTap: (index) {

        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: greenColor()),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: greenColor()),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: greenColor()),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: greenColor()),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
