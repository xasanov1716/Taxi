import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({
    super.key,
    required this.color,
    required this.title,
    required this.radius,
    required this.textColor,
    this.leftIcon = "",
    this.rightIcon = "",
    this.borderColor = Colors.transparent,
    this.width = 380.0,
    this.height = 58.0, required this.onTap,
  });

  final Color color;

  final Color textColor;

  final String title;
  final double radius;
  final String rightIcon;
  final String leftIcon;
  final Color  borderColor;
  final double height;
  final double width;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
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
                const SizedBox(width: 16),
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: "Urbanist",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: textColor,
                    height: 22 / 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(width: 16),
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
