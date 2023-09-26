import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/tab_box/profile/widgets/profile_dialog.dart';
import 'package:taxi_app/ui/widgets/user_image.dart';
import 'package:taxi_app/ui/tab_box/profile/widgets/log_out.dart';
import 'package:taxi_app/ui/tab_box/profile/widgets/profile_button.dart';
import 'package:taxi_app/ui/tab_box/profile/widgets/theme_changer_button.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/ui_utils/utilitiy_function.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String image = "";
  ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(left: 24.w),
            child: Image.asset(
              AppIcons.taxiLogotip,
              height: 32.h,
            ),
          ),
          title: Text(
            "Profile",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            getIcon(
              AppIcons.moreCircle,
              context: context,
              onTap: () {},
            ),
            12.pw
          ],
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            30.ph,
            UserImage(
              onTap: () {
                profileDialog(
                  picker: picker,
                  context: context,
                  valueChanged: (v) {
                    image = v;
                    setState(() {});
                  },
                );
              },
            ),
            12.ph,
            Text(
              "Andrew Ainsley",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            8.ph,
            Text(
              "+1 111 467 378 399",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            20.ph,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: const Divider(),
            ),
            ProfileButton(
              text: "Edit Profile",
              icon: AppIcons.profile,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteNames.editProfile,
                  arguments: false,
                );
              },
            ),
            ProfileButton(
                text: "Address",
                icon: AppIcons.location,
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.addressScreen);
                }),
            ProfileButton(
                text: "Notification",
                icon: AppIcons.notification,
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.notificationSwitch);
                }),
            ProfileButton(
                text: "Payment",
                icon: AppIcons.wallet,
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.payment);
                }),
            ProfileButton(
                text: "Security",
                icon: AppIcons.shieldDone,
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.security);
                }),
            ProfileButton(
              text: "Language",
              icon: AppIcons.moreCircle,
              onTap: () {
                Navigator.pushNamed(context, RouteNames.languageScreen);
              },
              isLanguage: true,
              language: tr("language_type"),
            ),
            const ThemeChangerButton(),
            ProfileButton(
                text: "Privacy Policy",
                icon: AppIcons.lock,
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.privacyPolicy);
                }),
            ProfileButton(
                text: "Help Center",
                icon: AppIcons.infoSquare,
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.helpCenterScreen);
                }),
            ProfileButton(
                text: "Invite Friends",
                icon: AppIcons.user3,
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.inviteFriends);
                }),
            ProfileButton(
              text: "Log Out",
              icon: AppIcons.logOut,
              onTap: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(32.r),
                    ),
                  ),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  showDragHandle: true,
                  context: context,
                  builder: (context) {
                    return const LogOutItem();
                  },
                );
              },
              isLogOut: true,
            ),
          ],
        ));
  }
}
