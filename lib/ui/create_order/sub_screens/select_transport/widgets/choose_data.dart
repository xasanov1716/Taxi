import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/ui_utils/utility_function.dart';

class ChooseData extends StatelessWidget {
  final String icon;
  final String text1;
  final String text2;
  final String text3;
  final bool selected;
  final Function(bool) onSelect;

  const ChooseData({
    Key? key,
    required this.icon,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.selected,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(24 * width / figmaWidth),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(icon),
                16.pw,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(text1, style: Theme.of(context).textTheme.titleLarge),
                    Text(text2, style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "\$ $text3",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                getIcon(selected ? AppIcons.circle : AppIcons.circleTwo,
                    context: context, onTap: () {
                  onSelect(!selected);
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
