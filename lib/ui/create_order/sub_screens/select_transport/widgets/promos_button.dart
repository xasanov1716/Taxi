import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class PromosButton extends StatefulWidget {
  const PromosButton({super.key});

  @override
  State<PromosButton> createState() => _PromosButtonState();
}

class _PromosButtonState extends State<PromosButton> {
  int promos = 0;

  @override
  Widget build(BuildContext context) {
    return promos != 0
        ? Wrap(
            runSpacing: 10.h,
            spacing: 10.w,
            children: [
              ...List.generate(
                promos,
                (index) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      color: AppColors.primary,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Discount 30% Off',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: AppColors.dark3,
                                  ),
                        ),
                        8.pw,
                        InkWell(
                          onTap: () {
                            setState(() {
                              promos--;
                            });
                          },
                          child: SvgPicture.asset(AppIcons.getSvg(
                              name: AppIcons.closeSquare,
                              iconType: IconType.lightOutline)),
                        ),
                      ],
                    ),
                  );
                },
              ),
              20.pw,
              getPlusButton(() {
                setState(() {
                  promos++;
                });
              }, context)
            ],
          )
        : Row(
            children: [
              Container(
                height: 56.h,
                width: 311.w,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: getTheme(context) ? AppColors.dark2 : AppColors.c_50,
                ),
                child: Text(
                  'Enter Promo Code',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.c_500,
                      ),
                ),
              ),
              20.pw,
              getPlusButton(() {
                Navigator.pushNamed(context, RouteNames.addPromo);
                setState(() {
                  promos++;
                });
              }, context)
            ],
          );
  }
}

getPlusButton(VoidCallback onTap, BuildContext context) {
  return InkWell(
    radius: 100.r,
    borderRadius: BorderRadius.circular(100.r),
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        color:
            getTheme(context) ? AppColors.dark3 : AppColors.orangeTransparent,
      ),
      child: Icon(
        Icons.add,
        size: 16.h,
        color: getTheme(context) ? AppColors.white : AppColors.dark3,
      ),
    ),
  );
}
