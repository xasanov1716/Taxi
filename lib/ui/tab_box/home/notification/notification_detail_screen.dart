import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/data/models/notification_model/notification_model.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/constants/constants.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/util_functions/format_timestamp.dart';

class NotificationDetailScreen extends StatelessWidget {
  const NotificationDetailScreen({Key? key, required this.notification}) : super(key: key);
  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(notification.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 68.w,
                      height: 68.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.r), color: AppColors.primary),
                      child: Center(
                        child: SvgPicture.asset(
                          AppIcons.getSvg(
                              name: iconMapping[notification.iconCode] ?? AppIcons.infoCircle,
                              iconType: IconType.bold),
                          width: 24.w,
                        ),
                      ),
                    ),
                    24.pw,
                    Text(formatTimestamp(notification.timestamp),
                        style: Theme.of(context).textTheme.titleMedium)
                  ],
                ),
                24.ph,
                Text(notification.body, style: Theme.of(context).textTheme.titleMedium)
              ],
            )
          ],
        ),
      ),
    );
  }
}
