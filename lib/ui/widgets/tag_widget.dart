import 'package:flutter/material.dart';

class TagWidget extends StatelessWidget {
  const TagWidget(
      {super.key,
      this.borderColor = Colors.blueAccent,
      this.color = Colors.blueAccent,
      this.textColor = Colors.white,
      this.radius = 6,
      required this.title});

  final Color borderColor;

  final Color color;

  final Color textColor;

  final String title;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: color,
          border: Border.all(color: borderColor)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Text(
          title,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(color: textColor),
        ),
      ),
    );
  }
}
