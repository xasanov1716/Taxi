import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import '../../../../../utils/colors/app_colors.dart';
import '../../../../../utils/icons/app_icons.dart';
import '../../../../../utils/size/screen_size.dart';
import '../../../../../utils/theme/get_theme.dart';

class GlobalBottomSheetStart extends StatelessWidget {
  const GlobalBottomSheetStart(
      {super.key,
      required this.centerText,
      required this.name,
      required this.carName,
      required this.starCount,
      required this.carNumber,
      required this.commentTitle,
      required this.commentSubtitle});

  final String centerText;
  final String name;
  final String carName;
  final String starCount;
  final String carNumber;
  final String commentTitle;
  final String commentSubtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          centerText,
          style: Theme.of(context).dialogTheme.titleTextStyle?.copyWith(
              fontSize: 24.sp,
              color: getTheme(context) ? AppColors.white : AppColors.c_900),
        ),
        24.ph,
        const Divider(),
        24.ph,
        Row(
          children: [
            SizedBox(
                height: 60.h,
                width: 60.w,
                child: Image.asset(AppIcons.testAvatar)),
            20.pw,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontFamily: "Urbanist",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                8.ph,
                Text(
                  carName,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontFamily: "Urbanist",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 20.w,
                      width: 20.w,
                      child: SvgPicture.asset(
                        AppIcons.rateStarUser,
                        colorFilter: const ColorFilter.mode(
                            AppColors.orange, BlendMode.srcIn),
                      ),
                    ),
                    8.pw,
                    Text(
                      starCount,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontFamily: "Urbanist",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
                8.ph,
                Text(
                  carNumber,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontFamily: "Urbanist",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                )
              ],
            )
          ],
        ),
        24.ph,
        const Divider(),
        24.ph,
        Text(
          commentTitle,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontFamily: "Urbanist",
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: getTheme(context) ? AppColors.white : AppColors.c_900),
        ),
        12.ph,
        Text(
          commentSubtitle,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontFamily: "Urbanist",
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: getTheme(context) ? AppColors.white : AppColors.c_700),
        )
      ],
    );
  }
}
