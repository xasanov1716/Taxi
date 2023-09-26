import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

import 'global_action_button.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 24.w, top: 65.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GlobalActionButtons(
            color: AppColors.dimYellow,
            icon: SvgPicture.asset(AppIcons.search),
            height: 52.h,
            width: 52.h,
            onTap: () {
              Navigator.pushNamed(
                context,
                RouteNames.searchLocationScreen,
              );
            },
          ),
          16.pw,
          GlobalActionButtons(
            color: AppColors.dimYellow,
            icon: SvgPicture.asset(
              AppIcons.notification,
            ),
            height: 52.h,
            width: 52.h,
            onTap: () {
              Navigator.pushNamed(context, RouteNames.notificationScreen);
            },
          ),
          16.pw,
          GlobalActionButtons(
            color: AppColors.dimYellow,
            icon: SvgPicture.asset(
              AppIcons.discount,
            ),
            height: 52.h,
            width: 52.h,
            onTap: () {
              Navigator.pushNamed(context, RouteNames.specialOffers);
            },
          ),
        ],
      ),
    );
  }
}
