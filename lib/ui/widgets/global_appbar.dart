import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSize {
  const GlobalAppBar({
    Key? key,
    this.onTap,
    this.title = "",
  }) : super(key: key);

  final VoidCallback? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      leading: onTap != null
          ? IconButton(
              padding: EdgeInsets.zero,
              onPressed: onTap,
              icon: SvgPicture.asset(AppIcons.arrowLeft),
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
