import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../data/local/storage_repository/storage_repository.dart';
import '../../../../../../utils/colors/app_colors.dart';

class SwitchWidgetForNotification extends StatefulWidget {
  const SwitchWidgetForNotification({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  State<SwitchWidgetForNotification> createState() =>
      _SwitchWidgetForNotificationState();
}

class _SwitchWidgetForNotificationState
    extends State<SwitchWidgetForNotification> {
  bool switchValue = false;

  @override
  void initState() {
    super.initState();
    switchValue = StorageRepository.getBool(widget.title, defValue: false);
  }

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 50.h,
      child: InkWell(
        onTap: () {
          setState(
            () {
              StorageRepository.putBool(widget.title, !switchValue);
              switchValue = !switchValue;
            },
          );
        },
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            widget.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w700),
          ),
          CupertinoSwitch(
            activeColor: AppColors.primary,

              value: switchValue,
              onChanged: (value) {
                setState(() {
                  StorageRepository.putBool(widget.title, value);
                  switchValue = !switchValue;
                });
              })
        ]),
      ),
    );
  }
}
