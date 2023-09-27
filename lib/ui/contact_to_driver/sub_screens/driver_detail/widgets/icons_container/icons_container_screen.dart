import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/ui_utils/utilitiy_function.dart';

class IconsContainer extends StatelessWidget {
  const IconsContainer({super.key, required this.icon, required this.onTap});
  final String icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: height >= 900 && width >= 600 ? 72.w : 56.w,
      height: height >= 900 && width >= 600  ? 72.w : 56.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              (height >= 900 && width >= 600) ? 100 : 36),
          color: AppColors.amber),
      child: getIcon(icon, context: context, onTap: onTap),
    );
  }
}
