import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/utils/ui_utils/utilitiy_function.dart';

import '../../../../../utils/icons/app_icons.dart';

class TopUpPaymentAppbar extends StatelessWidget implements PreferredSize {
  const TopUpPaymentAppbar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: getIcon(AppIcons.arrowLeft, context: context, onTap: () {
        Navigator.pop(context);
      }),
      title: Text(title, style: Theme.of(context).appBarTheme.titleTextStyle),
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 56.h);
}
