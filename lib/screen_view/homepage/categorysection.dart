import 'package:edhippo/bloc/homepage/category/category_bloc.dart';
import 'package:edhippo/bloc/homepage/category/category_state.dart';
import 'package:edhippo/modal/category_modal/school_types.dart';
import 'package:edhippo/ui_halper/util_colore.dart';
import 'package:edhippo/ui_halper/util_textstyle.dart';
import 'package:edhippo/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

categorySection() {
  return SizedBox(
    height: 100,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Browse by category',
          style: headingText24(),
        ),
        SizedBox(
          height: 60,
          child: BlocBuilder<CategoryBloc, CategoryState>(
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
                      ],
                    ),
                  );
                case DataStatus.success:
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.schoolList.length,
                    itemBuilder: (context, index) {
                      final name = state.schoolList[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: CategoryCard(name: name),
                      );
                    },
                  );
                default:
                  return const Center(child: Text('Unknown state'));
              }
            },
          ),
        )
      ],
    ),
  );
}

class CategoryCard extends StatelessWidget {
  final SchoolType name;

  const CategoryCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: bgColor(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            const SizedBox(width: 8),
            Text(name.name),
          ],
        ),
      ),
    );
  }
}
