import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/data/models/booking/booking_status.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';

class BookingStatusButton extends StatelessWidget {
  const BookingStatusButton({super.key, required this.status});

  final BookingStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: status == BookingStatus.active
            ? AppColors.primary
            : status == BookingStatus.completed
                ? AppColors.green
                : AppColors.error,
      ),
      child: Center(
        child: Text(
          status == BookingStatus.active
              ? "Active"
              : status == BookingStatus.completed
                  ? "Completed"
                  : "Cancelled",
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: status == BookingStatus.active
                  ? AppColors.dark3
                  : AppColors.white),
        ),
      ),
    );
  }
}
