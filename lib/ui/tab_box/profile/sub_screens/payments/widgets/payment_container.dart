import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class PaymentContainer extends StatelessWidget {
  const PaymentContainer(
      {super.key,
      required this.icon,
      required this.title,
      required this.state});

  final String icon;
  final String title;
  final String state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 12.h),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: getTheme(context)?AppColors.dark2:AppColors.white,
            boxShadow: const [
              BoxShadow(
                // Horizontal and vertical offset
                blurRadius: 60, // Blur radius
                spreadRadius: 0, // Spread radius
                color: Color.fromRGBO(4, 6, 15, 0.05), // Color with opacity
              ),
            ]),
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Row(children: [
            SvgPicture.asset(icon),
            12.pw,
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 18.sp, fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            Text(state,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary)),
          ]),
        ),
      ),
    );
  }
}
