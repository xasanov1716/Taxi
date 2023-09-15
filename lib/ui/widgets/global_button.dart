import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({
    super.key,
    this.color = Colors.blue,
    required this.title,
    this.radius = 16,
    this.textColor = Colors.white,
    this.leftIcon = "",
    this.rightIcon = "",
    this.borderColor = Colors.transparent,
    required this.onTap,
  });

  final Color color;

  final Color textColor;
  final String title;
  final double radius;
  final String rightIcon;
  final String leftIcon;
  final Color borderColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(width: 1, color: borderColor)),
      child: Material(
        borderRadius: BorderRadius.circular(radius),
        color: color,
        child: InkWell(
          borderRadius: BorderRadius.circular(radius),
          onTap: onTap,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                leftIcon.isEmpty ? const Text("") : SvgPicture.asset(leftIcon),
                SizedBox(width: 16.w),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontFamily: "Urbanist",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width: 16.w),
                rightIcon.isEmpty
                    ? const Text("")
                    : SvgPicture.asset(rightIcon),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
