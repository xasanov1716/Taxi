import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:taxi_app/blocs/notification_bloc/notification_bloc.dart';
import 'package:taxi_app/ui/tab_box/home/notification/widgets/global_notification_container.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';
import 'package:taxi_app/utils/ui_utils/error_message_dialog.dart';
import 'package:taxi_app/utils/ui_utils/loading_dialog.dart';
import 'package:taxi_app/utils/ui_utils/utility_function.dart';
import 'package:taxi_app/utils/util_functions/group_notifications_by_date.dart';

import 'package:taxi_app/utils/size/screen_size.dart';

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
          //getIcon(AppIcons.moreCircle, context: context, onTap: () {}),
        ],
      ),
      body: BlocConsumer<NotificationBloc, NotificationState>(
        listener: (context, state) {
          print('Current state: $state');
          if (state is NotificationUploadLoading) {
            showLoading(context: context);
          } else if (state is NotificationUploadError) {
            Navigator.pop(context);
            showErrorMessage(message: state.errorMessage, context: context);
          } else if (state is NotificationUploadSuccess) {
            return Navigator.pop(context);
          }
        },
        buildWhen: (previous, current) {
          return current.runtimeType == NotificationUploadSuccess;
        },
        builder: (BuildContext context, NotificationState state) {
          if (state is NotificationUploadSuccess) {
            final groupedNotifications = groupNotificationsByDate(state.notifications);
            return groupedNotifications.isEmpty
                ? Center(
                    child: Lottie.asset(AppIcons.emptyLottie, width: 350 * height / figmaHeight))
                : ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                    itemCount: groupedNotifications.length,
                    itemBuilder: (context, index) {
                      final date = groupedNotifications.keys
                          .elementAt(groupedNotifications.length - index - 1);
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
                            reverse: true,
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
          }
          return const SizedBox();
        },
      ),
    );
  }
}
// FutureBuilder(
// future: GetIt.I<DBHelper>().getAllNotifications(),
// builder: (context, snapshot) {
// if (snapshot.connectionState == ConnectionState.waiting) {
// return const Center(child: CircularProgressIndicator());
// } else if (snapshot.hasData) {

// } else if (snapshot.hasError) {
// return Center(child: Text(snapshot.error.toString()));
// }
// return Text(
// 'Something went wrong: Current state is ${snapshot.connectionState}',
// style: Theme.of(context).dialogTheme.titleTextStyle!.copyWith(
// fontSize: 18.sp, color: getTheme(context) ? AppColors.white : AppColors.c_900),
// );
// },
// )
