import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/ui_utils/utility_function.dart';

class EditAppBar extends StatelessWidget implements PreferredSize {
  const EditAppBar({super.key, required this.title, required this.hideBackButton});
  final String title;
  final bool hideBackButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      elevation: 0,
      leading:hideBackButton?null: getIcon(AppIcons.getSvg(name: AppIcons.arrowLeft),
          context: context, onTap: () {
        Navigator.pop(context);
      },),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }

  @override
  Widget get child => const SizedBox();

  @override
  Size get preferredSize => Size(double.infinity, 70.h);
}
