import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class GlobalActionButtons extends StatelessWidget {
  const GlobalActionButtons({
    Key? key,
    required this.color,
    required this.icon,
    required this.height,
    required this.width,
    required this.onTap,
  }) : super(key: key);

  final Color color;
  final SvgPicture icon;
  final double height;
  final double width;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: icon,
        ),
      ),
    );
  }
}
