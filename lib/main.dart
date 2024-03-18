
import 'package:edhippo/bloc/homepage/category/category_bloc.dart';
import 'package:edhippo/bloc/homepage/city/cities_bloc.dart';
import 'package:edhippo/bloc/homepage/featuredschools/featuredschools_bloc.dart';
import 'package:edhippo/bloc/searchpage/school_search/schoolsearch_bloc.dart';

import 'package:edhippo/screen_view/search_page/searchbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CitiesBloc()),
          BlocProvider(create: (_) => CategoryBloc()),
          BlocProvider(create: (_) => FeatureSchoolsBloc()),
          BlocProvider(create: (_) => SchoolSearchBloc()),




        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(

            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,

          ),
          debugShowCheckedModeBanner: false,
          home:  const SearchBarScreen(),


        ),
      );
  }
}
