import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/cubits/push_notification_cubit/push_notification_cubit.dart';
import 'package:taxi_app/data/models/notification_model/notification_model.dart';
import 'package:taxi_app/ui/tab_box/home/notification/screen/widget/widget_for_drop_down.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class NotificationTestScreen extends StatelessWidget {
  NotificationTestScreen({Key? key}) : super(key: key);
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('test notification'),
        centerTitle: true,
        elevation: 0,
        actions: const [DropDownButton()],
      ),

      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(label: Text('Title...'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          20.ph,
          TextField(
            controller: bodyController,
            decoration: InputDecoration(label: Text('Body...'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ), 20.ph,
          const DropDownButton(),
       const    Spacer(),
          InkWell(
            onTap: () {
              // String selectedIcon = context.read<DropDownButton>()._selectedValue; // Tanlangan qiymatni olish
              context.read<PushNotificationCubit>().getPushNotification(
                  NotificationModel(
                    timestamp: DateTime.now().millisecondsSinceEpoch,
                    title: titleController.text,
                    body: bodyController.text,
                    iconCode:'discount', // Tanlangan qiymatni iconCode ga yozish
                  )
              );
            },
            child: Text('switch'),
          )
        ],
      ),
    );
  }
}
