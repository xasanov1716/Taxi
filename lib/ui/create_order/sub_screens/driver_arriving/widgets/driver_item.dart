import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

import '../../../../../data/models/icon/icon_type.dart';
import '../../../../../utils/colors/app_colors.dart';
import '../../../../../utils/icons/app_icons.dart';
import '../../../../../utils/size/screen_size.dart';
import '../../../../../utils/theme/get_theme.dart';
import 'driver_button.dart';

class DriverItem extends StatelessWidget {
  const DriverItem(
      {super.key,
      required this.cancelTap,
      required this.chatTap,
      required this.callTap});

  final VoidCallback cancelTap;
  final VoidCallback chatTap;
  final VoidCallback callTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: getTheme(context) ? AppColors.dark1 : AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.w),
            topRight: Radius.circular(40.w),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          8.ph,
          Container(
            height: 3,
            width: 36.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: getTheme(context) ? AppColors.dark3 : AppColors.c_200,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(24.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Driver is Arriving...",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontFamily: "Urbanist",
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                Text(
                  "2 mins",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontFamily: "Urbanist",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Divider(
              height: 1,
              color: getTheme(context) ? AppColors.dark3 : AppColors.c_200,
            ),
          ),
          Container(
            margin: EdgeInsets.all(24.r),
            height: 60 * height / figmaHeight,
            width: double.infinity,
            child: Row(
              children: [
                SizedBox(
                    height: 60 * height / figmaHeight,
                    width: 60 * height / figmaHeight,
                    child: Image.asset(AppIcons.testAvatar)),
                20.pw,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Daniel Austin",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontFamily: "Urbanist",
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    Text(
                      "Mercedes-Benz E-Class",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontFamily: "Urbanist",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                    )
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
                            AppIcons.star,
                            colorFilter: const ColorFilter.mode(
                                AppColors.orange, BlendMode.srcIn),
                          ),
                        ),
                        8.pw,
                        Text(
                          "4.8",
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontFamily: "Urbanist",
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                    Text(
                      "HSW 4736 XK",
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DriverButton(
                  color: AppColors.dimYellow,
                  icon: AppIcons.cancel,
                  onTap: cancelTap),
              24.pw,
              DriverButton(
                color: AppColors.primaryBackground,
                icon: AppIcons.getSvg(
                    name: AppIcons.chat, iconType: IconType.bold),
                onTap: chatTap,
              ),
              24.pw,
              DriverButton(
                color: AppColors.primaryBackground,
                icon: AppIcons.getSvg(
                    name: AppIcons.call, iconType: IconType.bulk),
                onTap: callTap,
              ),
            ],
          ),
          26.ph
        ],
      ),
    );
  }
}
