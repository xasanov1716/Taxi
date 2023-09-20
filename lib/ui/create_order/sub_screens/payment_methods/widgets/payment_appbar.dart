import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../utils/colors/app_colors.dart';
import '../../../../../utils/icons/app_icons.dart';
import '../../../../../utils/theme/get_theme.dart';

class PaymentAppbar extends StatelessWidget implements PreferredSize{
  const PaymentAppbar({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: IconButton(
          padding: EdgeInsets.zero,
          onPressed: (){ Navigator.pop(context); },
          icon: SvgPicture.asset(
            AppIcons.arrowLeft,
            colorFilter: ColorFilter.mode(
                getTheme(context) ? AppColors.white : AppColors.c_900,
                BlendMode.srcIn),
          ),
        ),
        elevation: 0,
        title: Text(
          "Payment Methods",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontSize: 24.sp, fontWeight: FontWeight.w700),
        ),
        actions: [IconButton(onPressed: onTap, icon: SizedBox(height: 24.w, width: 24.w,child: SvgPicture.asset(AppIcons.plus, colorFilter: ColorFilter.mode(
            getTheme(context) ? AppColors.white : AppColors.c_900,
            BlendMode.srcIn),),),), SizedBox(width: 10.w,)]
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 56.h);
}
