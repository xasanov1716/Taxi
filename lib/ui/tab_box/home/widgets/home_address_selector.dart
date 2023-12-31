import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';


class HomeAddressSelector extends StatelessWidget {
  const HomeAddressSelector({super.key, required this.onTab});

  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.h),
      width: width,
      height: height / 7.7,
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.w),
            topRight: Radius.circular(40.w),
          )),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16.w),
        child: InkWell(
          borderRadius: BorderRadius.circular(16.w),
          onTap: onTab,
          child: Ink(
            padding: EdgeInsets.all(24.h),
            decoration: BoxDecoration(
              color: getTheme(context)?AppColors.dark3:AppColors.white,
              borderRadius: BorderRadius.circular(16.w),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Where would you go?",
                  style: TextStyle(
                    fontFamily: "Urbanist",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff9e9e9e),
                    height: 20 / 14,
                  ),
                ),
                SvgPicture.asset(
                  AppIcons.getSvg(
                    name: AppIcons.location,
                    iconType: IconType.bold,
                  ),
                  colorFilter: const ColorFilter.mode(
                    AppColors.c_500,
                    BlendMode.srcIn,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}