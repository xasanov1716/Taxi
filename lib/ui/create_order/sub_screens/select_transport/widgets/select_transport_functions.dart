import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';


getRow(String text, String icon, BuildContext context) {
  return Row(
    children: [
      SvgPicture.asset(
        AppIcons.getSvg(name: icon, iconType: IconType.curved),
        colorFilter: ColorFilter.mode(
          getTheme(context) ? AppColors.c_300 : AppColors.c_600,
          BlendMode.srcIn,
        ),
      ),
      8.pw,
      Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontWeight: FontWeight.w600),
      ),
    ],
  );
}

getPlusButton(VoidCallback onTap, BuildContext context) {
  return InkWell(
    radius: 100.r,
    borderRadius: BorderRadius.circular(100.r),
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        color:
        getTheme(context) ? AppColors.dark3 : AppColors.orangeTransparent,
      ),
      child: Icon(
        Icons.add,
        size: 16.h,
        color: getTheme(context) ? AppColors.white : AppColors.dark3,
      ),
    ),
  );
}
