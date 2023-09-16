// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/cubits/category_cubit/category_cubit.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';


class CategoryTile extends StatelessWidget {
  final String categoryName;
  final String selectedCategory;

  const CategoryTile(
    this.categoryName,
    this.selectedCategory, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryCubit = BlocProvider.of<CategoryCubit>(context);
    bool isSelected = categoryName == selectedCategory;

    return GestureDetector(
      onTap: () {
        categoryCubit.selectCategory(categoryName);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppColors.primary,width: 2),
          color: isSelected ? AppColors.primary : AppColors.white,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(
          children: [
            SvgPicture.asset(
              AppIcons.location,
              color: isSelected ? AppColors.white : AppColors.primary,
            ),
            const SizedBox(width: 8),
            Text(
              categoryName,
              style: TextStyle(
                color: isSelected ? AppColors.white : AppColors.primary,
                fontWeight: FontWeight.w600,
                fontSize: 16
              ),
            ),
          ],
        ),
      ),
    );
  }
}
