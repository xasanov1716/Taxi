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

class RememberCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final String? label;

  const RememberCheckBox({super.key, required this.value, required this.onChanged, this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            onChanged(!value);
          },
          child: Container(
            width: 24.0,
            height: 24.0,
            decoration: BoxDecoration(
              color: value ? AppColors.primary : null,
              border: Border.all(
                width: 3.0,
                color: AppColors.primary,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: value
                ? Icon(
                    Icons.check,
                    size: 16.0,
                    color: AppColors.white,
                  )
                : null,
          ),
        ),
        if (label != null) ...[
          12.pw,
          Text(
            label!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          )
        ]
      ],
    );
  }
}
