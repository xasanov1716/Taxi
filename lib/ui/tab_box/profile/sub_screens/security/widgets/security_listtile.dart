import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';

class SecurityListTile extends StatelessWidget {
  const SecurityListTile(
      {super.key,
      required this.isSwitched,
      required this.onTap,
      required this.text});
  final bool isSwitched;
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.all(24.w),
      title: Text(text),
      trailing: CupertinoSwitch(
        activeColor: AppColors.primary,

        value: isSwitched,
        onChanged: null,
      ),
    );
  }
}
