import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/auth/widgets/auth_navigator_button.dart';
import 'package:taxi_app/ui/auth/widgets/auth_text_field.dart';
import 'package:taxi_app/ui/auth/widgets/custom__auth_divider.dart';
import 'package:taxi_app/ui/auth/widgets/custom_auth_social_network_button.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

import '../widgets/remember_me.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 48.h, left: 24.w, right: 24.w, top: 24.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Ro`yxatdan o`ting',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              60.ph,
              Column(
                children: [
                  AuthTextField(hintText: 'Telefon Raqami', prefixIcon: AppIcons.call),
                  20.ph,
                  AuthTextField(hintText: 'Parol', prefixIcon: AppIcons.lock, isPassword: true),
                  20.ph,
                  RememberCheckBox(
                    label: 'Meni eslab qol',
                    value: isChecked,
                    onChanged: (value) {
                      isChecked = value;
                      setState(() {});
                    },
                    // label: 'Remember me',
                  ),
                  20.ph,
                  GlobalButton(
                      color: AppColors.primary,
                      title: 'Ro\'yxatdan o\'tish',
                      radius: 100,
                      textColor: AppColors.dark3,
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          RouteNames.fillProfile,
                        );
                      })
                ],
              ),
              60.ph,
              Column(
                children: [
                  CustomAuthDividerWidget(label: 'yoki davom eting'),
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
              60.ph,
              AuthNavigatorButton(
                title: "Hisobingiz bormi?",
                onTapTitle: "Kirish",
                onTap: () {
                  Navigator.pushReplacementNamed(context, RouteNames.login);
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
