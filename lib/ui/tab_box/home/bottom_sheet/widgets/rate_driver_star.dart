import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

class RateDriverStars extends StatefulWidget {
  const RateDriverStars({super.key});

  @override
  State<RateDriverStars> createState() => _RateDriverStarsState();
}

class _RateDriverStarsState extends State<RateDriverStars> {
  int selectRate = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          5,
          (index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectRate = index + 1;
                });
              },
              child: index < selectRate
                  ? SvgPicture.asset(
                      AppIcons.rateStar,
                      width: 40.w,
                    )
                  : SvgPicture.asset(
                      AppIcons.star,
                      // ignore: deprecated_member_use
                      color: AppColors.primary,
                      width: 40.w,
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
