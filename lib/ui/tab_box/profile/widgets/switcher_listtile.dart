import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';

class SwitcherListTile extends StatelessWidget {
  const SwitcherListTile({
    super.key,
    required this.isSwitched,
    required this.onTap,
    required this.text,
  });

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
        onChanged: (v){},
      ),
    );
  }
}
