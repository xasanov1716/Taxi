import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi_app/ui/tab_box/home/sub_screens/search_location/search_location_screen.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

import 'global_action_button.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 24.w, top: 35.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GlobalActionButtons(
            color: AppColors.dimYellow,
            icon: SvgPicture.asset(
              AppIcons.search,
            ),
            height: 52,
            width: 52,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchLocationScreen(),
                  ));
            },
          ),
          const SizedBox(
            width: 16,
          ),
          GlobalActionButtons(
            color: AppColors.dimYellow,
            icon: SvgPicture.asset(
              AppIcons.notification,
            ),
            height: 52,
            width: 52,
            onTap: () {},
          ),
          const SizedBox(
            width: 16,
          ),
          GlobalActionButtons(
            color: AppColors.dimYellow,
            icon: SvgPicture.asset(
              AppIcons.discount,
            ),
            height: 52,
            width: 52,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}