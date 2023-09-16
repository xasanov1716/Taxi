import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/auth/register/register_screen.dart';
import 'package:taxi_app/ui/auth/widgets/auth_navigator_button.dart';
import 'package:taxi_app/ui/auth/widgets/custom__auth_divider.dart';
import 'package:taxi_app/ui/auth/widgets/custom_auth_social_network_button.dart';

import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

import '../../../utils/colors/app_colors.dart';
import '../../widgets/global_button.dart';
import '../widgets/auth_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              45.ph,
              Text("Xush kelibsiz! Akkauntga kirish",
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontSize: width > 450 ? 48.sp : 30.sp)),
              45.ph,
              AuthTextField(
                hintText: "_ _  _ _ _  _ _  _ _",
                prefixIcon: AppIcons.call,
              ),
              24.ph,
              AuthTextField(
                hintText: "Parol",
                prefixIcon: AppIcons.lock,
                isPassword: true,
              ),
              24.ph,
              RememberCheckBox(
                  label: "Meni eslab qol",
                  value: isChecked,
                  onChanged: (v) {
                    setState(() {
                      isChecked = v;
                    });
                  }),
              24.ph,
              GlobalButton(
                  color: AppColors.primary,
                  radius: 100.r,
                  textColor: AppColors.dark3,
                  title: "Kirish",
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      RouteNames.fillProfile,
                    );
                  }),
              24.ph,
              Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, RouteNames.forgotPassword);
                    },
                    child: Text(
                      "Parolni unutdingizmi?",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary),
                    )),
              ),
              45.ph,
              Column(
                children: [
                  CustomAuthDividerWidget(label: "yoki davom eting"),
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
              45.ph,
              AuthNavigatorButton(
                title: "Akkauntingiz yo'qmi?",
                onTapTitle: "Ro'yxatdan o'ting",
                onTap: () {
                  Navigator.pushReplacementNamed(context, RouteNames.signUp);
                },
              )
            ],
          ),
        ),
      ),
    ));
  }
}
