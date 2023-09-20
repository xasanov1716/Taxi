import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi_app/data/models/payment/payment_model.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

import '../../../../../utils/colors/app_colors.dart';
import '../../../../../utils/icons/app_icons.dart';
import '../../../../../utils/size/screen_size.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key, required this.paymentModel, required this.isSelected, required this.onTap});
  final PaymentModel paymentModel;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      child: Container(
        height: 80*height/figmaHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: getTheme(context) ? AppColors.dark2 : AppColors.white,
          boxShadow: [
            BoxShadow(blurRadius: 10, color: getTheme(context) ? AppColors.dark2 : AppColors.c_100),
            BoxShadow(blurRadius: 20, color: getTheme(context) ? AppColors.dark2 : AppColors.c_100),
            BoxShadow(blurRadius: 30, color: getTheme(context) ? AppColors.dark2 : AppColors.c_100),
          ]
        ),
        child: Material(
          borderRadius: BorderRadius.circular(16.r),
          color: getTheme(context) ? AppColors.dark2 : AppColors.white,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.all(24.sp),
              child: Row(
                children: [SizedBox(height: 24.w, width: 24.w,child: SvgPicture.asset(paymentModel.paymentIcon),),
                  12.pw,
                  Text(paymentModel.title,style: Theme.of(context).textTheme.titleMedium?.copyWith(fontFamily: "Urbanist",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,),),
                  const Spacer(),
                  isSelected ? Text("\$${paymentModel.price}", style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontFamily: "Urbanist",
                    color: getTheme(context) ? AppColors.primary : AppColors.c_800,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),) : const SizedBox(),
                  12.pw,
                  SizedBox(height: 24.w, width: 24.w, child: isSelected ? SvgPicture.asset(AppIcons.selected) : SvgPicture.asset(AppIcons.unSelected),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
