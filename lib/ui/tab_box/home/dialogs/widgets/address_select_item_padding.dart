import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/ui/tab_box/home/widgets/text_field_item.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';

class AddressSelectionItem extends StatelessWidget {
  const AddressSelectionItem({super.key, required this.hintText, required this.startIconName, required this.endIconName});
  final String hintText;
  final String startIconName;
  final String endIconName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: TextFieldItem(
        hintText: hintText,
        startIcon: SvgPicture.asset(
          startIconName,
          width: 24.w,
          colorFilter: const ColorFilter.mode(
            AppColors.primary,
            BlendMode.srcIn,
          ),
        ),
        endIcon: SvgPicture.asset(
          endIconName,
          colorFilter: const ColorFilter.mode(
            AppColors.c_500,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
