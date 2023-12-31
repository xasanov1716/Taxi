import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class CustomAuthDividerWidget extends StatelessWidget {
  const CustomAuthDividerWidget({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          const Expanded(
            child: Divider(),
          ),
          9.pw,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: AppColors.c_700, fontSize: width > 450 ? 18.sp : 14.sp),
            ),
          ),
          9.pw,
          const Expanded(
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
