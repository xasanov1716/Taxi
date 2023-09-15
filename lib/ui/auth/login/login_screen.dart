import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/ui/auth/widgets/custom__auth_divider.dart';
import 'package:taxi_app/ui/auth/widgets/custom_auth_social_network_button.dart';
import 'package:taxi_app/ui/widgets/global_input.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 48.h, left: 24.w, right: 24.w, top: 24.h),
        child: Column(
          children: [
            Text('Create your Account'),
            Column(),
            Column(
              children: [
                CustomAuthDividerWidget(label: 'or continue with'),
                20.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomAuthButton(imageUrl: AppIcons.facebook, onTap: () {}),
                    CustomAuthButton(imageUrl: AppIcons.google, onTap: () {}),
                    CustomAuthButton(imageUrl: AppIcons.apple, onTap: () {}),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.c_500),
                ),
                8.pw,
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sign in',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColors.primary, fontWeight: FontWeight.w600),
                    ))
              ],
            ),
          ],
        ),
      )),
    );
  }
}
