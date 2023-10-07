import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/ui_utils/utility_function.dart';

class EditAppBar extends StatelessWidget implements PreferredSize {
  const EditAppBar({
    super.key,
    required this.title,
    required this.onTap,
    this.bottom,
  });
  final String title;
  final VoidCallback onTap;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      elevation: 0,
      leading: getIcon(
        AppIcons.getSvg(name: AppIcons.arrowLeft),
        context: context,
        onTap: onTap,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      bottom: bottom,
    );
  }

  @override
  Widget get child => const SizedBox();

  @override
  Size get preferredSize => Size(double.infinity, bottom != null ? 90.h : 56.h);
}
