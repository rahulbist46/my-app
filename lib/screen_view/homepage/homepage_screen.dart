
import 'package:edhippo/bloc/homepage/city/cities_bloc.dart';
import 'package:edhippo/bloc/homepage/city/cities_event.dart';
import 'package:edhippo/bloc/homepage/city/cities_state.dart';
import 'package:edhippo/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    
    super.initState();
    context.read<CitiesBloc>().add(FetchCitiesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Rest API'),
      ),
      body: BlocBuilder<CitiesBloc, CitiesState>(
        builder: (context, state) {
          switch (state.dataStatus) {
            case DataStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case DataStatus.failure:
              return Center(child: Text(state.message.toString()));
            case DataStatus.success:
              return ListView.builder(
                itemCount: state.citiesList.length,
                // Fix: use the length of the list
                itemBuilder: (context, index) {
                  final city = state
                      .citiesList[index]; // Fix: access the property on an item
                  return ListTile(
                    title: Text(city.city
                        .toString()), // Fix: access the property on an item
                  );
                },
              );
          }
        },
      ),
    );
  }
}