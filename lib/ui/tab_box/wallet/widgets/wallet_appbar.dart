import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

import '../../../../data/models/icon/icon_type.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/icons/app_icons.dart';
import '../../../../utils/theme/get_theme.dart';

class WalletAppbar extends StatelessWidget implements PreferredSize{
  const WalletAppbar({super.key, required this.searchTap, required this.onTap, required this.title});

  final VoidCallback searchTap;
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return  AppBar(
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
        IconButton(
          onPressed: searchTap,
          icon: SvgPicture.asset(AppIcons.getSvg(
            name: AppIcons.search,
            iconType: IconType.lightOutline,
          ),
            colorFilter: ColorFilter.mode(getTheme(context) ? AppColors.white : AppColors.c_900, BlendMode.srcIn),
          ),
        ),
        IconButton(
          onPressed: onTap,
          icon: SvgPicture.asset(AppIcons.getSvg(
            name: AppIcons.moreCircle,
            iconType: IconType.lightOutline,
          ),
            colorFilter: ColorFilter.mode(getTheme(context) ? AppColors.white : AppColors.c_900, BlendMode.srcIn),
          ),
        ),
        24.pw,
      ],
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 56.h);
}
