import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:taxi_app/utils/colors/app_colors.dart';

class TransactionStatusButton extends StatelessWidget {
  const TransactionStatusButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20.w),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r), color: AppColors.primary),
      child: Center(
        child: Text(
          "Paid",
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
    );
  }
}
