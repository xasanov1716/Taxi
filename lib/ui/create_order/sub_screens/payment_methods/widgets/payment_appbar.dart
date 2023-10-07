import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/utils/ui_utils/utility_function.dart';

import 'package:taxi_app/utils/icons/app_icons.dart';

class PaymentAppbar extends StatelessWidget implements PreferredSize {
  const PaymentAppbar({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: getIcon(AppIcons.arrowLeft, context: context, onTap: () {
          Navigator.pop(context);
        }),
        elevation: 0,
        title: Text(
          "Payment Methods",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontSize: 24.sp, fontWeight: FontWeight.w700),
        ),
        actions: [
          getIcon(AppIcons.plus, context: context, onTap: onTap),
          SizedBox(
            width: 10.w,
          )
        ]);
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size(double.infinity, 56.h);
}
