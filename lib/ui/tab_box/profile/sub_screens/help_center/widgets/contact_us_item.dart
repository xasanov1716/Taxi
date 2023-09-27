import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class ContactUsItem extends StatelessWidget {
  const ContactUsItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});
  final String title;
  final String icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(20.r)),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          color: (getTheme(context) ? AppColors.dark2 : AppColors.white)
              ,
        ),
        child: ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          leading: SvgPicture.asset(
            icon,
            width: 24.w,
          ),
        ),
      ),
    );
  }
}
