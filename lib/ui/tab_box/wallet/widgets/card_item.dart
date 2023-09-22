import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

import '../../../../data/models/icon/icon_type.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/icons/app_icons.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(24.sp),
      padding: EdgeInsets.all(32.sp),
      decoration: BoxDecoration(
          color: Color(0xFFF79E1B),
          borderRadius: BorderRadius.circular(32.r)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Text("Andrew Ainsley", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontFamily: "Urbanist",
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.white,),),
            const Spacer(),
            SizedBox(height: 32.h, width: 62.w, child: SvgPicture.asset(AppIcons.visa),),
            12.pw,
            SizedBox(height: 32.h, width: 41.w, child: SvgPicture.asset(AppIcons.masterCard),)
          ],),
          4.ph,
          Row(
            children: [
              Text("●●●● ●●●● ●●●● 3629", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontFamily: "Urbanist",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white
              ),)
            ],
          ),
          24.ph,
          Text("Your balance",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontFamily: "Urbanist",
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.white
            ),),
          8.ph,
          Row(
            children: [
              Text("\$957,5", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontFamily: "Urbanist",
                fontSize: 48.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.white
              ),),
              const Spacer(),
              InkWell(
                onTap: onTap,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.r),
                      color: AppColors.white
                  ),
                  child: Row(
                    children: [
                      SizedBox(height: 16.w, width: 16.w, child: SvgPicture.asset(AppIcons.getSvg(name: AppIcons.download,iconType: IconType.bold,)),),
                      8.pw,
                      Text("Top Up", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontFamily: "Urbanist",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.dark1
                      ),)
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
