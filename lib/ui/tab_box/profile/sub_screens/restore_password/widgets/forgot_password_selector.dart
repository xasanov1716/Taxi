import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

// ignore: must_be_immutable
class ForgotPasswordSelector extends StatefulWidget {
  ForgotPasswordSelector({
    super.key,
    required this.svg,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.pressed,
  });
  final String svg;
  final bool pressed;
  final String title;
  final String subtitle;
  VoidCallback onTap;

  @override
  State<ForgotPasswordSelector> createState() => _ForgotPasswordSelectorState();
}

class _ForgotPasswordSelectorState extends State<ForgotPasswordSelector> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: height * 128 / figmaHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
              color: widget.pressed
                  ? AppColors.disabledButton
                  : AppColors.c_900.withOpacity(0.3),
              width: 2.w),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: height * 0.02,
            left: width * 0.05,
            right: width * 0.05,
            bottom: height * 0.02,
          ),
          child: Row(
            children: [
              Container(
                  height: 80.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150.r),
                      color: AppColors.yellowBackground),
                  child: IconButton(
                    onPressed: null,
                    icon: SvgPicture.asset(
                      widget.svg,
                      colorFilter: const ColorFilter.mode(
                          AppColors.disabledButton, BlendMode.srcIn),
                    ),
                  )),
              20.pw,
              RichText(
                text: TextSpan(
                  text: widget.title,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 14.sp,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: widget.subtitle,
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(fontSize: 16.sp)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
