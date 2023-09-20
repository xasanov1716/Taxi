import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class SelectTransPrtBottomSheet extends StatelessWidget {
  const SelectTransPrtBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(
        color: getTheme(context) ? AppColors.dark1 : AppColors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24.r),
          topLeft: Radius.circular(24.r),
        ),
        border: Border.all(color: AppColors.dark3, width: 1),
      ),
      child: Column(
        children: [
          24.ph,
          Container(
            padding: EdgeInsets.all(20.r),
            decoration: BoxDecoration(
              color: getTheme(context) ? AppColors.dark2 : AppColors.c_100,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getRow('4.5 km', AppIcons.location, context),
                getRow('4 min', AppIcons.timeCircle, context),
                getRow('\$20.00', AppIcons.wallet, context),
              ],
            ),
          ),
          24.ph,
          GlobalButton(
            title: 'Continue',
            radius: 100.r,
            color: AppColors.primary,
            onTap: () {},
          ),
          36.ph,
        ],
      ),
    );
  }
}

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
