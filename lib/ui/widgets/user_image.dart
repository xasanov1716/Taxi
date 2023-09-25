import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/ui_utils/utilitiy_function.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/size/screen_size.dart';

class UserImage extends StatefulWidget {
  const UserImage({
    super.key,
    required this.userImage,
    required this.onTap,
  });

  final Widget userImage;
  final VoidCallback onTap;

  @override
  State<UserImage> createState() => _UserImageState();
}

class _UserImageState extends State<UserImage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 142 * height / figmaHeight,
          width: 142 * width / figmaWidth,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.c_50,
          ),
          child: Stack(
            children: [
              Center(
                child: widget.userImage,
              ),
              Positioned(
                bottom: -12.h,
                right: 3.w,
                child: getIcon(
                  AppIcons.editSquare,
                  context: context,
                  onTap: widget.onTap,
                  color: AppColors.primary,
                  iconType: IconType.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
