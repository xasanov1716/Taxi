import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwitchWidgetForNotification extends StatefulWidget {
  const SwitchWidgetForNotification({Key? key, required this.title, required this.callback}) : super(key: key);
final String title;
final VoidCallback callback;
  @override
  State<SwitchWidgetForNotification> createState() =>
      _SwitchWidgetForNotificationState();
}

class _SwitchWidgetForNotificationState
    extends State<SwitchWidgetForNotification> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 50.h,
      child: InkWell(
        onTap: () {  setState(() {
          widget.callback.call();
          switchValue = !switchValue;
        });},
        child:  Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),),
              CupertinoSwitch(
                  value: switchValue,
                  onChanged: (value) {
                    setState(() {
                      widget.callback.call();
                      switchValue = !switchValue;
                    });
                  })
            ]
          ),

      ),
    );
  }
}
