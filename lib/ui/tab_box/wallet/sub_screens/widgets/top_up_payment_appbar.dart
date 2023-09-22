import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../utils/colors/app_colors.dart';
import '../../../../../utils/icons/app_icons.dart';
import '../../../../../utils/theme/get_theme.dart';

class TopUpPaymentAppbar extends StatelessWidget implements PreferredSize{
  const TopUpPaymentAppbar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: SvgPicture.asset(
          AppIcons.arrowLeft,
          colorFilter: ColorFilter.mode(
              getTheme(context) ? AppColors.white : AppColors.black,
              BlendMode.srcIn),
        ),
      ),
      title: Text(title, style: Theme.of(context).appBarTheme.titleTextStyle),
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 56.h);
}
