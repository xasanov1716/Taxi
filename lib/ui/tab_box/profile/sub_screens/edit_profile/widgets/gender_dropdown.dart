import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/fonts/text_styles.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

// ignore: must_be_immutable
class GenderDropDown extends StatelessWidget {

   GenderDropDown({super.key, required this.onChanged, required this.gender});
final ValueChanged onChanged;
final String gender;
  var genders = ['Male', 'Female'];

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding:
      EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: getTheme(context)
            ? AppColors.dark2
            : AppColors
            .greysCale, // Use the desired background color
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        underline: const SizedBox(),
        dropdownColor: getTheme(context)
            ? AppColors.dark2
            : AppColors.greysCale,
        icon: SvgPicture.asset(
          AppIcons.getSvg(
              name: AppIcons.arrowDown2, iconType: IconType.bold),
          colorFilter: ColorFilter.mode(
              getTheme(context)
                  ? AppColors.white
                  : AppColors.c_900,
              BlendMode.srcIn),
        ),
        borderRadius: BorderRadius.circular(12.r),
        items: genders.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(
              items,
              style: AppTextStyle.bodyMediumSemibold.copyWith(
                  color: getTheme(context)
                      ? AppColors.white
                      : AppColors.c_900),
            ),
          );
        }).toList(),
        onChanged: onChanged,
        hint: Text(gender,
            style: AppTextStyle.bodyMediumSemibold.copyWith(
                color: getTheme(context)
                    ? AppColors.white
                    : AppColors.c_900)), // Placeholder text
      ),
    );
  }
}
