import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector(
      {super.key,
      required this.onTap,
      required this.isSelected,
      required this.title});

  final VoidCallback onTap;
  final bool isSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 4.h,
      ),
      onTap: onTap,
      title: Text(title),
      trailing: isSelected
          ? SvgPicture.asset(AppIcons.selected)
          : SvgPicture.asset(AppIcons.unSelected),
    );
  }
}
