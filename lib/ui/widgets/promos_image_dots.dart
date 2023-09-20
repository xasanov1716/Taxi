import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

import '../../utils/colors/app_colors.dart';

class DotsGroup extends StatelessWidget {
  DotsGroup({required this.imagePath, required this.color});
  final String imagePath;
  final Gradient color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 103.w,
      height: 100.h,
      child: Stack(
        children: [
          Positioned(
            left: 11.w,
            top: 9.h,
            child: Container(
              width: 63.w,
              height: 63.h,
              decoration:  ShapeDecoration(
                gradient: color,
                shape: const OvalBorder(),
              ),
            ),
          ),
          Positioned(
            left: 75.w,
            top: 9.h,
            child: Container(
              width: 7.w,
              height: 7.h,
              decoration:  ShapeDecoration(
                gradient: color,
                shape: const OvalBorder(),
              ),
            ),
          ),
          Positioned(
            left: 4.w,
            top: 0,
            child: Container(
              width: 9.w,
              height: 9.h,
              decoration:  ShapeDecoration(
                gradient: color,
                shape: const OvalBorder(),
              ),
            ),
          ),
          Positioned(
            left: 2.w,
            top: 57.h,
            child: Container(
              width: 4.w,
              height: 4.h,
              decoration:  ShapeDecoration(
                gradient: color,
                shape: const OvalBorder(),
              ),
            ),
          ),
          Positioned(
            left: 71.w,
            top: 70.h,
            child: Container(
              width: 2,
              height: 2,
              decoration:  ShapeDecoration(
                gradient: color,
                shape: const OvalBorder(),
              ),
            ),
          ),
          Positioned(
            left: 29.w,
            top: 22.h,
            child: Container(
              width: 26,
              height: 26,
              padding: const EdgeInsets.symmetric(
                  horizontal: 2.17, vertical: 3.25),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 20,
                    height: 22,
                    child: SvgPicture.asset(imagePath,colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 46.w,
            top: 1,
            child: Container(
              width: 2,
              height: 2,
              decoration:  ShapeDecoration(
                gradient: color,
                shape: const OvalBorder(),
              ),
            ),
          ),
          Positioned(
            left: 26.w,
            top: 77.h,
            child: Container(
              width: 3,
              height: 3,
              decoration:  ShapeDecoration(
                gradient: color,
                shape: const OvalBorder(),
              ),
            ),
          ),
          Positioned(
            left: 54.w,
            top: 76.h,
            child: Container(
              width: 1,
              height: 1,
              decoration:  ShapeDecoration(
                gradient: color,
                shape: const OvalBorder(),
              ),
            ),
          ),
          Positioned(
            left: 74.w,
            top: 48.h,
            child: Container(
              width: 2,
              height: 2,
              decoration:  ShapeDecoration(
                gradient: color,
                shape: const OvalBorder(),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 33.h,
            child: Container(
              width: 1,
              height: 1,
              decoration:  ShapeDecoration(
                gradient: color,
                shape: const OvalBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
