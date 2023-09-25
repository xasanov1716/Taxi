import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/ui/tab_box/home/notification/widgets/global_notification_container.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
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
        leading: getIcon(AppIcons.arrowLeft, context: context, onTap: (){Navigator.pop(context);}),
        title: Text("Notification",
            style: Theme.of(context).appBarTheme.titleTextStyle),
        actions: [
          getIcon(AppIcons.moreCircle, context: context, onTap: (){}),
        ],
      ),
      body: ListView(
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
                GlobalNotificationContainer(
                  title: "Payment Successful!",
                  text: "You have made a taxi payment",
                  icon: AppIcons.money,
                ),
                24.ph,
                GlobalNotificationContainer(
                  title: "Credit Card Connected!",
                  text: "Credit Card has been linked!",
                  icon: AppIcons.card,
                ),
              ],
            ),
          ),
          30.ph
        ],
      ),
    );
  }
}
