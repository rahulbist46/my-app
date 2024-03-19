import 'package:edhippo/bloc/searchpage/school_search/schoolsearch_bloc.dart';
import 'package:edhippo/bloc/searchpage/school_search/schoolsearch_event.dart';
import 'package:edhippo/screen_view/search_page/searchschoolcard.dart';
import 'package:flutter/material.dart';

import 'package:edhippo/screen_view/search_page/search_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import your SearchBarItem widget

class SearchBarScreen extends StatefulWidget {
  const SearchBarScreen({super.key});

  @override
  State<SearchBarScreen> createState() => _SearchBarScreenState();
}

class _SearchBarScreenState extends State<SearchBarScreen> {
  @override
  void initState() {
    
    super.initState();
    context.read<SchoolSearchBloc>().add(FetchSchoolSearchEvent());
  }
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        leading: const CircleAvatar(
          radius: 15,
          child: Icon(Icons.arrow_back_ios_new, ),
        ),
        actions: const [
          CircleAvatar(
            radius: 30,
            child: Icon(Icons.filter),
          )
        ],
        title: const Center(
          child: Text('Search results'),
        ),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(11.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchBarItem(),
                SearchCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
