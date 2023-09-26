import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class ArrowLeftButton extends StatelessWidget {
  const ArrowLeftButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: 52.w,
        width: 52.w,
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: getTheme(context)
                ? AppColors.primaryBackground
                : AppColors.dimYellow),
        child: SvgPicture.asset(
          AppIcons.arrowLeft2,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
