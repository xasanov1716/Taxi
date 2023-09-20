import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import '../../../../../../utils/size/screen_size.dart';
class IconsContainer extends StatelessWidget {
  const IconsContainer({super.key, required this.icon, required this.onTap});
   final String icon;
   final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return  Container(
        width: 72 * width / figmaWidth,
        height: 72 * width / figmaWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(36.r),
            color: AppColors.amber),
        child: IconButton(
          onPressed: onTap,
          icon: SvgPicture.asset(icon),
        ));
  }
}
