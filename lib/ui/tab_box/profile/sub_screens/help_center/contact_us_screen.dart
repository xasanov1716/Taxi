import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/help_center/widgets/contact_us_item.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(24.w),
      children: [
        ContactUsItem(
            title: 'Customer Service', icon: AppIcons.head, onTap: () {}),
        24.ph,
        ContactUsItem(title: 'Whatsapp', icon: AppIcons.whatsapp, onTap: () {}),
        24.ph,

        ContactUsItem(title: 'Website', icon: AppIcons.web, onTap: () {}),
        24.ph,

        ContactUsItem(
            title: 'Facebook', icon: AppIcons.helpfacebook, onTap: () {}),
        24.ph,

        ContactUsItem(title: 'Twitter', icon: AppIcons.twitter, onTap: () {}),
        24.ph,

        ContactUsItem(
            title: 'Instagram', icon: AppIcons.instagram, onTap: () {}),
        24.ph,

      ],
    );
  }
}
