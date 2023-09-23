import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

import '../../widgets/switcher_listtile.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  bool rememberMeValue = false;
  bool faceId = false;
  bool biometricId = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
          onTap: () {
            Navigator.pop(context);
          },
          title: "Security"),
      body: Column(
        children: [
          SwitcherListTile(
              isSwitched: rememberMeValue,
              onTap: () {
                setState(() {
                  rememberMeValue = !rememberMeValue;
                });
              },
              text: "Remember me"),
          SwitcherListTile(
              isSwitched: faceId,
              onTap: () {
                setState(() {
                  faceId = !faceId;
                });
              },
              text: "Face ID"),
          SwitcherListTile(
              isSwitched: biometricId,
              onTap: () {
                setState(() {
                  biometricId = !biometricId;
                });
              },
              text: "Biometric ID"),
          ListTile(
            onTap: () {},
            contentPadding: EdgeInsets.all(24.w),
            title: const Text("Google Authenticator"),
            trailing: SvgPicture.asset(AppIcons.arrowRight2),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: GlobalButton(
              title: 'Change PIN',
              onTap: () {},
              color: AppColors.primary,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: GlobalButton(
              title: 'Change Password',
              onTap: () {},
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
