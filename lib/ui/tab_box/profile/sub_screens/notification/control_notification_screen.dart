import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/notification/widgets/switch_widget_for_notification.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class ControlNotificationScreen extends StatefulWidget {
  const ControlNotificationScreen({Key? key}) : super(key: key);

  @override
  State<ControlNotificationScreen> createState() =>
      _ControlNotificationScreenState();
}

class _ControlNotificationScreenState extends State<ControlNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: "Notification",
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: ListView(
          children: [
            24.ph,
            SwitchWidgetForNotification(
              title: 'General Notification',
              callback: () {},
            ),
            40.ph,
            SwitchWidgetForNotification(
              title: 'Sound',
              callback: () {},
            ),
            40.ph,
            SwitchWidgetForNotification(
              title: 'Vibrate',
              callback: () {},
            ),
            40.ph,
            SwitchWidgetForNotification(
              title: 'Special Offers',
              callback: () {},
            ),
            40.ph,
            SwitchWidgetForNotification(
              title: 'Promo & Discount',
              callback: () {},
            ),
            40.ph,
            SwitchWidgetForNotification(
              title: 'Payments',
              callback: () {},
            ),
            40.ph,
            SwitchWidgetForNotification(
              title: 'Cashback',
              callback: () {},
            ),
            40.ph,
            SwitchWidgetForNotification(
              title: 'App Updates',
              callback: () {},
            ),
            40.ph,
            SwitchWidgetForNotification(
              title: 'New Service Available',
              callback: () {},
            ),
            40.ph,
            SwitchWidgetForNotification(
              title: 'New Tips Available',
              callback: () {},
            ),40.ph
          ]
        ),
      ),
    );
  }
}
