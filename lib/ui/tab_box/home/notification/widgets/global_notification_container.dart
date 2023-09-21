import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import '../../../../../utils/theme/get_theme.dart';

class GlobalNotificationContainer extends StatelessWidget {
  const GlobalNotificationContainer(
      {super.key, required this.title, required this.text, required this.icon});

  final String title;
  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: getTheme(context) ? AppColors.dark2 : AppColors.white,
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 4), // Horizontal and vertical offset
            blurRadius: 60, // Blur radius
            spreadRadius: 0, // Spread radius
            color: Color.fromRGBO(4, 6, 15, 0.05), // Color with opacity
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, RouteNames.bottomSheetDialog);
        },
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
          padding: EdgeInsets.all(16.r),
          child: Row(
            children: [
              Container(
                width: 68.w,
                height: 68.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    color: AppColors.primary),
                child: Center(child: SvgPicture.asset(icon, width: 24.w)),
              ),
              20.pw,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: Theme.of(context).textTheme.titleLarge,
                      overflow: TextOverflow.ellipsis),
                  8.ph,
                  Text(text,
                      style: Theme.of(context).textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
