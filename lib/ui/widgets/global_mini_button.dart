import 'package:flutter/material.dart';

class GlobalMiniButton extends StatelessWidget {
  const GlobalMiniButton(
      {super.key,
      required this.child,
      required this.radius,
      required this.color,
      required this.onTap,
      this.borderColor = Colors.transparent, required this.size});

  final Widget child;
  final Color color;
  final double radius;
  final VoidCallback onTap;
  final Color borderColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(width: 2, color: borderColor)),
      child: Material(
        borderRadius: BorderRadius.circular(radius),
        color: color,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(radius),
          child: child,
        ),
      ),
    );
  }
}
