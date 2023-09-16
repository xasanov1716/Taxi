import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

restorePasswordSuccess(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          content: Container(
            padding: EdgeInsets.only(
              top: 31 * height / figmaHeight,
              left: 32 * width / figmaWidth,
              right: 32 * width / figmaWidth,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32.h),
              color: Theme.of(context).dialogTheme.backgroundColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppIcons.createNewPasswordDialog,
                  width: 180.w,
                ),
                30.ph,
                Text('Congratulations!',
                    style: Theme.of(context).dialogTheme.titleTextStyle),
                16.ph,
                Center(
                  child: Text(
                    'Your account is ready to use. You will be redirected to the Home page in a few seconds..!',
                    style: Theme.of(context).textTheme.titleMedium!,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 99 * height / figmaHeight,
                  child: LottieBuilder.asset(AppIcons.splashCircular),
                ),
              ],
            ),
          ),
        );
      });
    },
  );
}
