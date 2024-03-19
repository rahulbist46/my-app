import 'package:flutter/material.dart';

class SchoolDetails extends StatefulWidget {
  final String schoolId;


  const SchoolDetails({super.key, required this.schoolId});

  @override
  State<SchoolDetails> createState() => _SchoolDetailsState();
}

class _SchoolDetailsState extends State<SchoolDetails> {

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
