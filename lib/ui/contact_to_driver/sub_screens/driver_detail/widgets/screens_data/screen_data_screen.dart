import 'package:flutter/material.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class ScreenData extends StatelessWidget {
  const ScreenData(
      {super.key,
      required this.column,
      required this.radius,
      required this.height,
      required this.width});
  final Column column;
  final double radius;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    double height1 = MediaQuery.of(context).size.height;
    double width1 = MediaQuery.of(context).size.width;
    return Container(
      height: height * height1 / figmaHeight,
      width: width * width1 / figmaWidth,
      decoration: BoxDecoration(
        color: getTheme(context)? AppColors.dark2: AppColors.greysCale,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Padding(
        padding: EdgeInsets.all(
             24 * width1 / figmaWidth,),
        child: column,
      ),
    );
  }
}
