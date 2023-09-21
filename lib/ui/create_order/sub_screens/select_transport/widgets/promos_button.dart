import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class PromosButton extends StatefulWidget {
  const PromosButton({super.key});

  @override
  State<PromosButton> createState() => _PromosButtonState();
}

class _PromosButtonState extends State<PromosButton> {
  int promos = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox();

  }
}

getPlusButton(VoidCallback onTap, BuildContext context) {
  return InkWell(
    radius: 100.r,
    borderRadius: BorderRadius.circular(100.r),
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        color:
            getTheme(context) ? AppColors.dark3 : AppColors.orangeTransparent,
      ),
      child: Icon(
        Icons.add,
        size: 16.h,
        color: getTheme(context) ? AppColors.white : AppColors.dark3,
      ),
    ),
  );
}
