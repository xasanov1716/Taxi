import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/ui/auth/widgets/custom__auth_divider.dart';
import 'package:taxi_app/ui/auth/widgets/custom_auth_social_network_button.dart';
import 'package:taxi_app/ui/auth/widgets/login_middle_body.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding:
            EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h, bottom: 48.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Login to your Account",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 48.sp,
                    ),
              ),
              45.ph,
              LoginMiddleBody(),
              45.ph,
              Column(
                children: [
                  CustomAuthDividerWidget(label: "or continue with"),
                  20.ph,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomAuthButton(
                          imageUrl: AppIcons.facebook, onTap: () {}),
                      CustomAuthButton(imageUrl: AppIcons.google, onTap: () {}),
                      CustomAuthButton(imageUrl: AppIcons.apple, onTap: () {}),
                    ],
                  )
                ],
              ),
              45.ph
            ],
          ),
        ),
      ),
    ));
  }
}
