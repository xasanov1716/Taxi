import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/cubits/notifications_cubit/notification_cubit.dart';
import 'package:taxi_app/ui/tab_box/profile/widgets/switcher_listtile.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';

class ControlNotificationScreen extends StatelessWidget {
  const ControlNotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: "Notification",
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            itemCount: state.notificationNames.length,
            itemBuilder: (context, index) {
              String notification = state.notificationNames[index];
              bool value = state.notificationValues[index];

              return SwitcherListTile(
                isSwitched: value,
                onTap: () {
                  context
                      .read<NotificationCubit>()
                      .updateNotificationValues(
                          notification, !value, state.notificationNames);
                },
                text: notification,
              );
            },
          );
        },
      ),
    );
  }
}
