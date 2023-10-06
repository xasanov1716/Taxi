import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';


class OnBoardingAppBar extends StatelessWidget implements PreferredSize {
  const OnBoardingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness:
        getTheme(context) ? Brightness.dark : Brightness.light,
        statusBarIconBrightness:
        getTheme(context) ? Brightness.light : Brightness.dark,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 20 / 428,
            vertical: height * 15 / 926,
          ),
          child: TextButton(
            style: TextButton.styleFrom(padding: EdgeInsets.all(2.r)),
            onPressed: () {
              StorageRepository.deleteBool("isFirst");
            },
            child: Text(
              tr("skip"),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(decoration: TextDecoration.underline),
            ),
          ),
        )
      ],
      elevation: 0,
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity,56);
}
