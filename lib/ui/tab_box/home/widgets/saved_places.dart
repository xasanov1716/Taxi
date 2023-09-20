import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

import '../../../../data/models/icon/icon_type.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/icons/app_icons.dart';

class SavedPlaces extends StatelessWidget {
  const SavedPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          const Divider(),
          20.ph,
          Row(
            children: [
              SvgPicture.asset(
                AppIcons.getSvg(
                  name: AppIcons.bookmark,
                  iconType: IconType.bold,
                ),
                colorFilter: const ColorFilter.mode(
                  AppColors.yellow,
                  BlendMode.srcIn,
                ),
              ),
              30.pw,
              const Text("Saved Places",style: TextStyle(color: Colors.black),),
              const Spacer(),
              SvgPicture.asset(
                AppIcons.getSvg(
                  name: AppIcons.arrowRight,
                  iconType: IconType.bold,
                ),
                colorFilter: const ColorFilter.mode(
                  AppColors.yellow,
                  BlendMode.srcIn,
                ),
              ),

            ],
          ),
          20.ph,
          const Divider(),
        ],
      ),
    );
  }
}
