import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/fonts/text_styles.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

void showGlobalAlertDialog(
    {required BuildContext context,
    required String title,
    String text = "",
    required String image,
    required VoidCallback onTap}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
        content: Container(
          padding: EdgeInsets.only(top: 40.h, left: 32.w, right: 32.w, bottom: 32.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              color: Theme.of(context).scaffoldBackgroundColor),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                image,
                width: 160.w,
                height: 160.h,
              ),
              32.ph,
              Text(
                title,
                style: AppTextStyle.h4Bold
                    .copyWith(color: getTheme(context) ? AppColors.primary : AppColors.c_900),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
              16.ph,
              Text(
                text,
                style: AppTextStyle.bodyLargeRegular
                    .copyWith(color: getTheme(context) ? AppColors.white : AppColors.c_900),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
              32.ph,
              GlobalButton(
                title: "OK",
                textColor: AppColors.c_900,
                onTap: onTap,
                radius: 100.r,
              )
            ],
          ),
        ),
        contentPadding: EdgeInsets.zero,
      );
    },
  );
}
