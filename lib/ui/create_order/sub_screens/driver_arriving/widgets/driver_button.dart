import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DriverButton extends StatelessWidget {
  const DriverButton(
      {super.key,
      required this.color,
      required this.icon,
      required this.onTap});
  final Color color;
  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.w,
      width: 72.w,
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(36.r),
        color: color,
        child: InkWell(
          onTap: onTap,
          child: SvgPicture.asset(
            icon,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
