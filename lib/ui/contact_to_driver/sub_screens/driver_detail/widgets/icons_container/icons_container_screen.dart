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
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return  Container(
        width: (width>=figmaWidth||width>=1800)?72.w:56.w,
        height: (height>=figmaHeight||height>=2560)?72.w:56.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular((width>=figmaWidth||width>=1800)?100:36),
            color: AppColors.amber),
        child: IconButton(
          onPressed: onTap,
          icon: SvgPicture.asset(icon,height: (height>=figmaHeight||height>=2560)?40.w:24.w,width: (width>=figmaWidth||width>=1800)?40.w:24.w),
        ));
  }
}
