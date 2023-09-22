import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../utils/icons/app_icons.dart';

class SmileWidgets extends StatelessWidget {
  const SmileWidgets({
    super.key,
    required this.icon1,
    required this.icon2,
    required this.icon3,
  });

  final String icon1;
  final String icon2;
  final String icon3;

  @override
  Widget build(BuildContext context) {
    List<String> smiles = [
      AppIcons.smileUnhappy,
      AppIcons.smileCry,
      AppIcons.smileTired,
      AppIcons.smileAngry,
      AppIcons.smileQuiet,
      AppIcons.smileVeryHappy,
      AppIcons.smileExcited,
      AppIcons.smileHappy,
      AppIcons.smileEyeGlass
    ];
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {},
              child: Image.asset(icon1, width: 80.w, height: 80.h),
            ),
            GestureDetector(
              onTap: () {},
              child: Image.asset(icon2, width: 80.w, height: 80.h),
            ),
            GestureDetector(
              onTap: () {},
              child: Image.asset(icon3, width: 80.w, height: 80.h),
            ),
          ],
        ),
      ],
    );
  }
}

List<String> smiles = [
  AppIcons.smileUnhappy,
  AppIcons.smileCry,
  AppIcons.smileTired,
  AppIcons.smileAngry,
  AppIcons.smileQuiet,
  AppIcons.smileVeryHappy,
  AppIcons.smileExcited,
  AppIcons.smileHappy,
  AppIcons.smileEyeGlass
];
