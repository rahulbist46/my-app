import 'package:edhippo/bloc/searchpage/school_search/schoolsearch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/searchpage/school_search/schoolsearch_event.dart';

class SearchBarItem extends StatelessWidget {
  const SearchBarItem({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (filterKey) {
        context.read<SchoolSearchBloc>().add(SearchItem(filterKey));
      },


      decoration: InputDecoration(
        hintText: 'Enter School Name',
        fillColor: const Color(0xFFF5F4F8),
        filled: true,
        suffixIcon: const Icon(Icons.search),
        prefixIcon: const Icon(Icons.email_outlined),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.black12,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.black12,
          ),

        ),

      ),
    );
  }
}
