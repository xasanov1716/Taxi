import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSize {
  const GlobalAppBar({
    Key? key,
    this.onTap,
    this.action, this.centerTitle,
    this.title = "",
  }) : super(key: key);

  final VoidCallback? onTap;
  final String title;
  final List<Widget>? action;
  final bool? centerTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: action,
      elevation: 0,
      centerTitle: centerTitle,
      leading: onTap != null
          ? IconButton(
        padding: EdgeInsets.zero,
        onPressed: onTap,
        icon: Platform.isIOS
            ? Icon(
          Icons.arrow_back_ios,
          color: getTheme(context) ? AppColors.white : AppColors.c_900,
        )
            : SvgPicture.asset(
          AppIcons.arrowLeft,
          color: getTheme(context) ? AppColors.white : AppColors.c_900,
        ),
      )
          : null,
      title: title.isNotEmpty
          ? Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 24.sp, fontWeight: FontWeight.w700),
            )
          : null,
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size(double.infinity, 56.h);
}
