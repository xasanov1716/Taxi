import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/ui_utils/utility_function.dart';

class GetLocationAppBar extends StatelessWidget implements PreferredSize {
  const GetLocationAppBar({
    Key? key,
    this.arrowLeftOnTap,
    this.moreOnTap,
    this.title = "",
  }) : super(key: key);

  final VoidCallback? arrowLeftOnTap;
  final VoidCallback? moreOnTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: getIcon(Platform.isIOS ? AppIcons.arrowLeft : AppIcons.arrowLeft,
          context: context, onTap: arrowLeftOnTap),
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontSize: 24.sp, fontWeight: FontWeight.w700),
      ),
      actions: [
        getIcon(AppIcons.moreCircle, context: context, onTap: moreOnTap),
      ],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size(double.infinity, 56.h);
}
