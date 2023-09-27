import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration( label: Text('Title...'),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          ),
          20.ph,
          TextField(
            controller: bodyController,
            decoration: InputDecoration( label: Text('Body...'),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          ), 20.ph,
        const  DropDownButton(),


        ],
      ),
    );
  }
}
