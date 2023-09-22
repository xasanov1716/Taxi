import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/size/screen_size.dart';

class UserImage extends StatefulWidget {
  const UserImage({
    super.key,
    required this.userImage,
    required this.edit,
    required this.onTap,
  });

  final Widget userImage;
  final String edit;
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
                bottom: 0,
                right: 0.w,
                child: IconButton(
                  onPressed: widget.onTap,
                  icon: SvgPicture.asset(
                    widget.edit,
                    colorFilter: const ColorFilter.mode(
                        AppColors.primary, BlendMode.srcIn),
                    width: 35 * width / figmaWidth,
                    height: 35 * height / figmaHeight,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
