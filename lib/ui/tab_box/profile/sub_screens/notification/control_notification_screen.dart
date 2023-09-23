import 'package:flutter/material.dart';
import 'package:taxi_app/ui/tab_box/profile/widgets/switcher_listtile.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';

class ControlNotificationScreen extends StatefulWidget {
  const ControlNotificationScreen({Key? key}) : super(key: key);

  @override
  State<ControlNotificationScreen> createState() =>
      _ControlNotificationScreenState();
}

class _ControlNotificationScreenState extends State<ControlNotificationScreen> {
  bool generalNotification = false;
  bool sound = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: "Notification",
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: ListView(
        children: [
          SwitcherListTile(
            isSwitched: generalNotification,
            onTap: () {
              setState(() {
                generalNotification = !generalNotification;
              });
            },
            text: "General Notification",
          ),
          SwitcherListTile(
            isSwitched: sound,
            onTap: () {
              setState(() {
                sound = !sound;
              });
            },
            text: "Sound",
          ),
        ],
      ),
    );
  }
}
