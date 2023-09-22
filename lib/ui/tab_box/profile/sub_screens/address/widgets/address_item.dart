import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

class AddressItem extends StatelessWidget {
  const AddressItem(
      {Key? key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.onTap})
      : super(key: key);

  final String image;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.only(bottom: 24.h),
          padding: EdgeInsets.only(top: 24.h, left: 24.w, right: 24.w),
          child: ListTile(
            leading: Image.asset(image),
            title: Text(title),
            trailing: SvgPicture.asset(
              AppIcons.edit,
              colorFilter:
                  const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
            ),
            subtitle: Text(subtitle),
          )),
    );
  }
}
