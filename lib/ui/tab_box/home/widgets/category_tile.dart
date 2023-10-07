// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app/cubits/address_cubit/address_cubit.dart';
import 'package:taxi_app/cubits/category_cubit/category_cubit.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class CategoryTile extends StatelessWidget {
  final String categoryName;
  final String selectedCategory;
  final String kind;
  final LatLng latLng;

  const CategoryTile(
    this.categoryName,
    this.selectedCategory, {
    Key? key,
    required this.kind,
    required this.latLng,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryCubit = BlocProvider.of<CategoryCubit>(context);
    bool isSelected = categoryName == selectedCategory;

    return GestureDetector(
      onTap: () {
        context.read<AddressCubit>().kind = kind;
        context.read<AddressCubit>().getAddressByLatLong(latLng: latLng);
        categoryCubit.selectCategory(categoryName);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppColors.primary, width: 2),
          color: isSelected
              ? AppColors.primary
              : getTheme(context)
                  ? AppColors.dark2
                  : AppColors.white,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(
          children: [
            SvgPicture.asset(
              AppIcons.getSvg(
                name: AppIcons.location,
                iconType: IconType.bold,
              ),
              color: isSelected
                  ? getTheme(context)
                      ? AppColors.dark2
                      : AppColors.white
                  : AppColors.primary,
              width: 16.w,
            ),
            const SizedBox(width: 8),
            Text(
              categoryName,
              style: TextStyle(
                  color: isSelected
                      ? getTheme(context)
                          ? AppColors.dark2
                          : AppColors.white
                      : AppColors.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
