import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GlobalMiniButton extends StatelessWidget {
  const GlobalMiniButton(
      {super.key,
      required this.height,
      required this.width,
      required this.icon,
      required this.radius,
      required this.color, required this.onTap});

  final double height;
  final double width;
  final String icon;
  final Color color;
  final double radius;
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
          onTap: onTap,
          borderRadius: BorderRadius.circular(radius),
          child: Center(child: SvgPicture.asset(icon)),
        ),
      ),
    );
  }
}
