import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/fonts/text_styles.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class DropDownForRequest extends StatelessWidget {
  const DropDownForRequest(
      {super.key,
      required this.listFromOutside,
      required this.itemFromOutside,
      required this.onChanged});

  final List<String> listFromOutside;
  final String itemFromOutside;
  final ValueChanged onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: getTheme(context) ? AppColors.dark2 : AppColors.greysCale,
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        underline: const SizedBox(),
        dropdownColor:
            getTheme(context) ? AppColors.dark2 : AppColors.greysCale,
        icon: SvgPicture.asset(
          AppIcons.getSvg(name: AppIcons.arrowDown2, iconType: IconType.bold),
          colorFilter: ColorFilter.mode(
              getTheme(context) ? AppColors.white : AppColors.c_900,
              BlendMode.srcIn),
        ),
        borderRadius: BorderRadius.circular(12.r),
        items: listFromOutside.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(
              items,
              style: AppTextStyle.bodyMediumSemibold.copyWith(
                  color: getTheme(context) ? AppColors.white : AppColors.c_900),
            ),
          );
        }).toList(),
        onChanged: onChanged,
        hint: Text(itemFromOutside,
            style: AppTextStyle.bodyMediumSemibold.copyWith(
                color: getTheme(context)
                    ? AppColors.white
                    : AppColors.c_900)), // Placeholder text
      ),
    );
  }
}
