import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';


dialog(BuildContext context) {
  print(AdaptiveTheme.of(context).theme == AdaptiveTheme.of(context).darkTheme);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          top: 210 * height / figmaHeight,
          left: 44 * width / figmaWidth,
          right: 44 * width / figmaWidth,
          bottom: 200 * height / figmaHeight,
        ),
        child: Container(
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
              SizedBox(
                  height: height < 735
                      ? 170 * height / figmaHeight
                      : 180 * height / figmaHeight,
                  width: 186 * width / figmaWidth,
                  child: Image.asset(AppIcons.createNewPasswordDialog)),
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
    },
  );
}
