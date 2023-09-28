import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/data/models/notification_model/notification_model.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/constants/constants.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class GlobalNotificationContainer extends StatelessWidget {
  const GlobalNotificationContainer({super.key, required this.notificationModel});

  final NotificationModel notificationModel;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: getTheme(context) ? AppColors.dark2 : AppColors.white,
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 60,
            spreadRadius: 0,
            color: Color.fromRGBO(4, 6, 15, 0.05),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, RouteNames.notificationDetail, arguments: notificationModel);
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
                    borderRadius: BorderRadius.circular(100.r), color: AppColors.primary),
                child: Center(
                    child: SvgPicture.asset(
                        AppIcons.getSvg(
                            name: iconMapping[notificationModel.iconCode] ?? AppIcons.infoCircle,
                            iconType: IconType.bold),
                        width: 24.w)),
              ),
              20.pw,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(notificationModel.title,
                      style: Theme.of(context).textTheme.titleLarge,
                      overflow: TextOverflow.ellipsis),
                  8.ph,
                  Text(notificationModel.body,
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
