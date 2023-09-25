import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi_app/data/models/transaction/transaction_model.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

import '../../../../data/models/icon/icon_type.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/icons/app_icons.dart';
import '../../../../utils/size/screen_size.dart';
import '../../../../utils/theme/get_theme.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({super.key, required this.onTap, required this.transactionModel});
  final VoidCallback onTap;
  final TransactionModel transactionModel;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: getTheme(context) ? AppColors.dark1 : AppColors.white,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: Row(
            children: [
              SizedBox(
                  height: 60 * height / figmaHeight,
                  width: 60 * height / figmaHeight,
                  child: Image.asset(AppIcons.testAvatar)),
              20.pw,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transactionModel.name,
                    style:
                    Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  8.ph,
                  Text(
                    transactionModel.date,
                    style:
                    Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\$${transactionModel.price}",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  8.ph,
                  Row(
                    children: [
                      Text(
                        transactionModel.expense,
                        style:
                        Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      4.pw,
                      SizedBox(
                        height: 20.w,
                        width: 20.w,
                        child: SvgPicture.asset(
                          AppIcons.getSvg(name: transactionModel.iconName, iconType: IconType.bold),
                          colorFilter: ColorFilter.mode(transactionModel.iconColor, BlendMode.srcIn),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
