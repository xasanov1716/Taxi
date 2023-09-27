import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:taxi_app/data/local/local_database/database_helper.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/data/models/notification_model/notification_model.dart';
import 'package:taxi_app/ui/tab_box/home/notification/widgets/global_notification_container.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/constants/constants.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';
import 'package:taxi_app/utils/ui_utils/utilitiy_function.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: getIcon(AppIcons.arrowLeft, context: context, onTap: () {
          Navigator.pop(context);
        }),
        title: Text("Notification", style: Theme.of(context).appBarTheme.titleTextStyle),
        actions: [
          getIcon(AppIcons.moreCircle, context: context, onTap: () {}),
        ],
      ),
      body: FutureBuilder(
        future: GetIt.I<DBHelper>().getAllNotifications(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            final groupedNotifications = groupNotificationsByDate(snapshot.data!);
            return groupedNotifications.isEmpty
                ? Center(
                    child: Text(
                    'Notifications is empty',
                    style: Theme.of(context).dialogTheme.titleTextStyle!.copyWith(
                        fontSize: 18.sp,
                        color: getTheme(context) ? AppColors.white : AppColors.c_900),
                  ))
                : ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    itemCount: groupedNotifications.length,
                    itemBuilder: (context, index) {
                      final date = groupedNotifications.keys.elementAt(index);
                      final notifications = groupedNotifications[date]!;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            date,
                            style: Theme.of(context).dialogTheme.titleTextStyle!.copyWith(
                                fontSize: 18.sp,
                                color: getTheme(context) ? AppColors.white : AppColors.c_900),
                          ),
                          24.ph,
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: notifications.length,
                            itemBuilder: (context, innerIndex) {
                              final notification = notifications[innerIndex];
                              return GlobalNotificationContainer(
                                  title: notification.title,
                                  text: notification.body,
                                  icon: AppIcons.getSvg(
                                      name:
                                          iconMapping[notification.iconCode] ?? AppIcons.infoCircle,
                                      iconType: IconType.bold));
                            },
                            separatorBuilder: (BuildContext context, int index) => 24.ph,
                          )
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) => 24.ph,
                  );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          return Text(
            'Something went wrong: Current state is ${snapshot.connectionState}',
            style: Theme.of(context).dialogTheme.titleTextStyle!.copyWith(
                fontSize: 18.sp, color: getTheme(context) ? AppColors.white : AppColors.c_900),
          );
        },
      ),
    );
  }
}

Map<String, List<NotificationModel>> groupNotificationsByDate(
    List<NotificationModel> notifications) {
  final Map<String, List<NotificationModel>> groupedNotifications = {};

  for (final notification in notifications) {
    final date = DateTime.fromMillisecondsSinceEpoch(notification.timestamp);
    final dateString = _getDateString(date);

    if (!groupedNotifications.containsKey(dateString)) {
      groupedNotifications[dateString] = [];
    }

    groupedNotifications[dateString]!.add(notification);
  }

  return groupedNotifications;
}

String _getDateString(DateTime date) {
  final now = DateTime.now();
  if (date.year == now.year && date.month == now.month && date.day == now.day) {
    return 'Today';
  } else if (date.year == now.year && date.month == now.month && date.day == now.day - 1) {
    return 'Yesterday';
  } else {
    return '${date.day}/${date.month}/${date.year}';
  }
}

/*
* body: ListView(
        children: [
          24.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Today",
                  style: Theme.of(context).dialogTheme.titleTextStyle!.copyWith(
                      fontSize: 18.sp,
                      color: getTheme(context)
                           ? AppColors.white
                          : AppColors.c_900),
                ),
                24.ph,
                GlobalNotificationContainer(
                    title: "30% Special Discount!",
                    text: "Special promotion only valid today",
                    icon: AppIcons.getSvg(
                        name: AppIcons.discount, iconType: IconType.bold)),
                24.ph,
                GlobalNotificationContainer(
                    title: "Top Up E-Wallet Successful!",
                    text: "You have to top up your e-wallet",
                    icon: AppIcons.getSvg(
                        name: AppIcons.wallet, iconType: IconType.bold)),
                24.ph,
                Text(
                  "Yesterday",
                  style: Theme.of(context).dialogTheme.titleTextStyle!.copyWith(
                      fontSize: 18.sp,
                      color: getTheme(context)
                          ? AppColors.white
                          : AppColors.c_900),
                ),
                24.ph,
                GlobalNotificationContainer(
                    title: "New Services Available!",
                    text: "Now you can track drivers in real time",
                    icon: AppIcons.getSvg(
                        name: AppIcons.location, iconType: IconType.bold)),
                24.ph,
                Text(
                  "December 22, 2024",
                  style: Theme.of(context).dialogTheme.titleTextStyle!.copyWith(
                      fontSize: 18.sp,
                      color: getTheme(context)
                          ? AppColors.white
                          : AppColors.c_900),
                ),
                24.ph,
                const GlobalNotificationContainer(
                  title: "Payment Successful!",
                  text: "You have made a taxi payment",
                  icon: AppIcons.money,
                ),
                24.ph,
                const GlobalNotificationContainer(
                  title: "Credit Card Connected!",
                  text: "Credit Card has been linked!",
                  icon: AppIcons.card,
                ),
              ],
            ),
          ),
          30.ph
        ],
      ),*/
