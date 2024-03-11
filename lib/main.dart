
import 'package:edhippo/bloc/homepage/city/cities_bloc.dart';
import 'package:edhippo/screen_view/homepage/homepage_screen.dart';
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

          BlocProvider(
            create: (context) => CitiesBloc(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(

            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,

          ),
          debugShowCheckedModeBanner: false,
          home:  const HomePage(),


        ),
      );
  }
}
