import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

import '../../../../../utils/icons/app_icons.dart';

class DetailedTransactionOfUser extends StatelessWidget {
  const DetailedTransactionOfUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      padding: EdgeInsets.all(24.w), 
      decoration: BoxDecoration(
        color: getTheme(context)?AppColors.dark2:AppColors.white,
        borderRadius: BorderRadius.circular(16.r)
      ),
      child: Row(
        children: [
          Image.asset(
            AppIcons.drFake1,
            width: 60 * width / figmaWidth,
            height: 60 * height / figmaHeight,
          ),
          20.pw,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Daniel Austin",
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                "Mercedes-Benz E-Cl..",
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),
          12.pw,
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    AppIcons.getSvg(
                      name: AppIcons.star,
                      iconType: IconType.bulk,
                    ),
                    colorFilter: const ColorFilter.mode(
                      AppColors.orange,
                      BlendMode.srcIn,
                    ),
                    width: 20 * width / figmaWidth,
                    height: 20 * height / figmaHeight,
                  ),
                  Text(
                    "4.8",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
              Text(
                "HSW 4736 XK",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color:
                        getTheme(context) ? AppColors.white : AppColors.c_900,
                    fontWeight: FontWeight.w600),
              )
            ],
          )
        ],
      ),
    );
  }
}
