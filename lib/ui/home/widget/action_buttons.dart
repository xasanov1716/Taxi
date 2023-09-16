import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/icons/app_icons.dart';
import 'global_action_button.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 24.w , top: 22.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GlobalActionButtons(
            color: AppColors.dimYellow,
            icon: SvgPicture.asset(
              AppIcons.search,
            ),
            height: 52,
            width: 52 ,
            onTap: () {},
          ),
          SizedBox(
            width: 16 ,
          ),
          GlobalActionButtons(
            color: AppColors.dimYellow,
            icon: SvgPicture.asset(
              AppIcons.notification,
            ),
            height: 52 ,
            width: 52 ,
            onTap: () {},
          ),
          SizedBox(
            width: 16 ,
          ),
          GlobalActionButtons(
            color: AppColors.dimYellow,
            icon: SvgPicture.asset(
              AppIcons.discount,
            ),
            height: 52 ,
            width: 52 ,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
