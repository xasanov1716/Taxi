import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/ui/tab_box/wallet/sub_screens/widgets/status_button.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class DetailedPaymentMethods extends StatelessWidget {
  const DetailedPaymentMethods({super.key, required this.onCopyTap});

  final VoidCallback onCopyTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      padding: EdgeInsets.only(left: 24.w, top: 24.h, bottom: 24.h),
      decoration: BoxDecoration(
          color: getTheme(context) ? AppColors.dark2 : AppColors.white,
          borderRadius: BorderRadius.circular(16.r)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 24.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Payments Methods",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: getTheme(context) ? AppColors.c_300 : AppColors.c_700,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.2,
                          ),
                    ),
                    Text(
                      "My E-Wallet",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: getTheme(context) ? AppColors.c_100 : AppColors.c_800,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.2,
                          ),
                    ),
                  ],
                ),
                20.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Date",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: getTheme(context) ? AppColors.c_300 : AppColors.c_700,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.2,
                          ),
                    ),
                    Text(
                      "Dec 20, 2024 | 10:00:27 AM",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: getTheme(context) ? AppColors.c_100 : AppColors.c_800,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.2,
                          ),
                    ),
                  ],
                ),
                20.ph,
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Transaction ID",
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: getTheme(context) ? AppColors.c_300 : AppColors.c_700,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.2,
                    ),
              ),
              const Spacer(),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "SK7263727399",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: getTheme(context) ? AppColors.c_100 : AppColors.c_800,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.2,
                        ),
                  ),
                  IconButton(
                    onPressed: onCopyTap,
                    icon: SvgPicture.asset(AppIcons.getSvg(name: AppIcons.copyTransaction)),
                  )
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Status",
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: getTheme(context) ? AppColors.c_300 : AppColors.c_700,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.2,
                    ),
              ),
              const TransactionStatusButton()
            ],
          )
        ],
      ),
    );
  }
}
