import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HorizontalTab extends StatelessWidget {
  const HorizontalTab(
      {Key? key,
      required this.title,
      required this.color,
      this.leftImage = '',
      this.rightImage = '',
      required this.height})
      : super(key: key);

  final String title;
  final Color color;
  final String leftImage;
  final String rightImage;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            SvgPicture.asset(leftImage),
            SizedBox(
              width: 8.w,
            ),
            Text(title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: color)),
            SizedBox(
              width: 8.w,
            ),
            SvgPicture.asset(rightImage),
            const Spacer(),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          width: 160,
          height: height,
          color: color,
        )
      ],
    );
  }
}
