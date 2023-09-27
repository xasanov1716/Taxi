import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

class GetLocationMiddleStack extends StatelessWidget {
  const GetLocationMiddleStack({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final textLength = text.length;
    final svgWidth = 50.w + (textLength * 5.0);
    return Stack(
      children: [
        Center(
          child: SvgPicture.asset(
            AppIcons.frame,
            width: svgWidth,
          ),
        ),
        Positioned.fill(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                text,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: AppColors.black,
                    fontSize: 12.0.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 150.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              color: AppColors.primaryBackground.withOpacity(0.5),
            ),
            height: 52,
            width: 52,
            child: Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: AppColors.primaryBackground.withOpacity(0.9),
              ),
              height: 36.h,
              width: 36.w,
              child: SvgPicture.asset(
                AppIcons.getSvg(
                  name: AppIcons.location,
                  iconType: IconType.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
