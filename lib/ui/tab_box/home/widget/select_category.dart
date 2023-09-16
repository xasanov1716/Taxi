import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/cubits/category_cubit/category_cubit.dart';

import 'category_tile.dart';

class CategoryOfAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, String>(
      builder: (context, selectedCategory) {
        return SizedBox(
          height: 38 ,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 12 ),
            scrollDirection: Axis.horizontal,
            children: [
              ...List.generate(
                names.length,
                (index) => CategoryTile(
                    names[index], selectedCategory),
              ),
            ],
          ),
        );
      },
    );
  }
}

List<String> names = [
  "Home",
  "Office",
  "Apartment",
  "Hotel",
];
