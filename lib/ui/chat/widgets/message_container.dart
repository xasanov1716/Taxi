import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class MessageContainer extends StatelessWidget {
  const MessageContainer({
    super.key,
    required this.index,
    required this.message,
    required this.dateTime,
  });
  final int index;
  final String message;
  final String dateTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      decoration: BoxDecoration(
        gradient: index.isEven ? null : AppColors.gradientOrangeYellow,
        color: index.isEven
            ? getTheme(context)
                ? AppColors.dark3
                : AppColors.c_100
            : null,
        borderRadius: index.isEven
            ? BorderRadius.only(
                topRight: Radius.circular(12.r),
                bottomLeft: Radius.circular(12.r),
                bottomRight: Radius.circular(12.r),
              )
            : BorderRadius.only(
                topLeft: Radius.circular(12.r),
                bottomLeft: Radius.circular(12.r),
                bottomRight: Radius.circular(12.r),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            message,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: index.isEven
                      ? getTheme(context)
                          ? AppColors.white
                          : AppColors.c_900
                      : AppColors.dark3,
                ),
          ),
          SizedBox(
            // height: Theme.of(context).textTheme.bodyMedium!.fontSize,
            child: Text(
              dateTime,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: index.isEven
                        ? getTheme(context)
                            ? AppColors.c_300
                            : AppColors.c_600
                        : AppColors.c_700,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
