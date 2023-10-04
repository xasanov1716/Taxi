import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

import '../colors/app_colors.dart';
import '../size/screen_size.dart';
import '../theme/get_theme.dart';

void showErrorMessage({
  required String message,
  required BuildContext context,
}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          backgroundColor:
          getTheme(context) ? AppColors.dark2 : AppColors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LottieBuilder.asset(AppIcons.error),
              30.ph,
              Text('ERROR!',
                  style: Theme.of(context).dialogTheme.titleTextStyle),
              16.ph,
              Center(
                child: Text(
                  message,
                  style: Theme.of(context).textTheme.titleMedium!,
                  textAlign: TextAlign.center,
                ),
              ),
              16.ph,

              SizedBox(
                height: 78 * height / figmaHeight,
                child: GlobalButton(
                  title: 'OK',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}

Future<void> showConfirmMessage({
  required String message,
  required BuildContext context,
}) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) => StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          backgroundColor:
              getTheme(context) ? AppColors.dark2 : AppColors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          content: Column(
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
                  message,
                  style: Theme.of(context).textTheme.titleMedium!,
                  textAlign: TextAlign.center,
                ),
              ),
              16.ph,

              SizedBox(
                height: 78 * height / figmaHeight,
                child: GlobalButton(
                  title: 'OK',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
