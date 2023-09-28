import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:taxi_app/data/local/local_database/database_helper.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/tab_box/home/notification/widgets/global_notification_container.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';
import 'package:taxi_app/utils/ui_utils/utilitiy_function.dart';
import 'package:taxi_app/utils/util_functions/group_notifications_by_date.dart';

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
          getIcon(AppIcons.notification, context: context, onTap: () {
            Navigator.pushNamed(context, RouteNames.sendNotificationScreen);
          }),
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
                                notificationModel: notification,
                              );
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
