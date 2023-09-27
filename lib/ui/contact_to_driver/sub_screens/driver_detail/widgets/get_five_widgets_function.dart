import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/ui/contact_to_driver/sub_screens/driver_detail/widgets/second_item/second_item_container.dart';
import 'package:taxi_app/ui/contact_to_driver/sub_screens/driver_detail/widgets/third_item/third_item_container.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/ui_utils/utilitiy_function.dart';

List<Widget> getFiveWidgetsInDrDetails(BuildContext context,
    {required VoidCallback onCopyButtonPressed}) {
  return [
    Center(
        child: CircleAvatar(
          radius: 60.r,
          child: Image.asset(AppIcons.testAvatar),
        )),
    Text('Daniel Austin',
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontSize: 22.sp,
          fontWeight: FontWeight.w700,
        )),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('+1-202-555-0161',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            )),
        getIcon(AppIcons.copy, context: context, onTap:onCopyButtonPressed),
      ],
    ),
    const SecondItemContainer(),
    const ThirdItemContainer(),
  ];
}