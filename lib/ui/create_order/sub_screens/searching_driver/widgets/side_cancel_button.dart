import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

import 'package:taxi_app/utils/colors/app_colors.dart';

class SideCancelButton extends StatelessWidget {
  const SideCancelButton({super.key, required this.onTap, required this.title, required this.icon});
  final VoidCallback onTap;
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230 * width / figmaWidth,
      height: 68 * height / figmaHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        color: getTheme(context) ? AppColors.dark1 : AppColors.white,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(100.r),
        color: getTheme(context) ? AppColors.dark1 : AppColors.white,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(100.r),
          child: Row(
            children: [
              12.pw,
              SizedBox(
                height: 44.w,
                width: 44.w,
                child: SvgPicture.asset(icon),
              ),
              16.pw,
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontFamily: "Urbanist",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
