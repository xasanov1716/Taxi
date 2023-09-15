import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    super.key,
    required this.imageUrl,
    this.label,
    required this.onTap,
  });

  final String imageUrl;
  final String? label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(AppColors.white),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: AppColors.c_200)))),
        onPressed: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 18.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(imageUrl),
              if (label != null) ...[
                12.pw,
                Text(
                  label!,
                  style:
                      Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                )
              ],
            ],
          ),
        ));
  }
}
