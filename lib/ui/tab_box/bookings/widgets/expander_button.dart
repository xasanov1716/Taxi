import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class BookingExpanderButton extends StatelessWidget {
  const BookingExpanderButton({
    super.key,
    required this.expandTap,
    this.isExpanded = false,
  });

  final VoidCallback expandTap;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.orangeBackground,
      onTap: expandTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        height: 60 * height / figmaHeight,
        child: Center(
          child: IconButton(
              onPressed: null,
              // color: getTheme(context) ? AppColors.white : AppColors.c_900,
              icon: SvgPicture.asset(
                AppIcons.getSvg(
                    name: isExpanded ? AppIcons.arrowUp2 : AppIcons.arrowDown2,
                    iconType: IconType.lightOutline),
                colorFilter: ColorFilter.mode(
                    getTheme(context) ? AppColors.white : AppColors.c_900,
                    BlendMode.srcIn),
              )),
        ),
      ),
    );
  }
}
