import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class TransactionPersistentHeader extends SliverPersistentHeaderDelegate {
  TransactionPersistentHeader({required this.onTap});
  @override
  double get minExtent => 50.h;

  @override
  double get maxExtent => 50.h;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(color: getTheme(context) ? AppColors.dark1 : AppColors.white),
      child: Row(
        children: [
          Text(
            tr('transaction_history'),
            style:
            Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: onTap,
            child: Text(
             tr('see_all'),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
