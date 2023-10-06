import 'package:flutter/material.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/ui_utils/utility_function.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSize {
  const GlobalAppBar({
    Key? key,
    this.onTap,
    this.action,
    this.centerTitle,
    this.title = "",
  }) : super(key: key);

  final VoidCallback? onTap;
  final String title;
  final List<Widget>? action;
  final bool? centerTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      actions: action,
      elevation: 0,
      centerTitle: centerTitle,
      leading: onTap != null
          ? getIcon(AppIcons.arrowLeft, context: context, onTap: onTap!)
          : null,
      title: title.isNotEmpty
          ? Text(title, style: Theme.of(context).textTheme.headlineMedium)
          : null,
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size(double.infinity, 56);
}
