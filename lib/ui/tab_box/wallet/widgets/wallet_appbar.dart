import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class WalletAppbar extends StatelessWidget implements PreferredSize {
  const WalletAppbar({
    super.key,
    required this.searchTap,
    required this.onTap,
    required this.title,
  });

  final VoidCallback searchTap;
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(left: 24.w),
        child: Image.asset(
          AppIcons.taxiLogotip,
          width: 32.w,
          height: 32.w,
        ),
      ),
      title: Text(title),
      actions: [
        // IconButton(
        //   onPressed: searchTap,
        //   icon: SvgPicture.asset(
        //     AppIcons.getSvg(
        //       name: AppIcons.search,
        //       iconType: IconType.lightOutline,
        //     ),
        //     colorFilter: ColorFilter.mode(
        //         getTheme(context) ? AppColors.white : AppColors.c_900, BlendMode.srcIn),
        //   ),
        // ),
        // IconButton(
        //   onPressed: onTap,
        //   icon: SvgPicture.asset(
        //     AppIcons.getSvg(
        //       name: AppIcons.moreCircle,
        //       iconType: IconType.lightOutline,
        //     ),
        //     colorFilter: ColorFilter.mode(
        //         getTheme(context) ? AppColors.white : AppColors.c_900, BlendMode.srcIn),
        //   ),
        //  ),
        12.pw,
      ],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}
