import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/auth/widgets/auth_navigator_button.dart';
import 'package:taxi_app/ui/auth/widgets/auth_text_field.dart';
import 'package:taxi_app/ui/auth/widgets/custom_auth_divider.dart';
import 'package:taxi_app/ui/auth/widgets/social_auth_buttons.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
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

  FocusNode phoneFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
          onTap: () {
            Navigator.pop(context);
          },
          title: ""),
      body: Center(
        child: SingleChildScrollView(
          padding:
              EdgeInsets.only(bottom: 48.h, left: 24.w, right: 24.w, top: 24.h),
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
                  AuthTextField(
                    focusNode: phoneFocus,
                    hintText: 'Telefon Raqami',
                    prefixIcon: AppIcons.call,
                    onChanged: (v) {
                      if (v.length == 12) {
                        phoneFocus.unfocus();
                        FocusScope.of(context).requestFocus(passwordFocus);
                      }
                    },
                  ),
                  20.ph,
                  AuthTextField(
                    focusNode: passwordFocus,
                    hintText: 'Parol',
                    prefixIcon: AppIcons.lock,
                    isPassword: true,
                    onChanged: (v) {},
                  ),
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
                          RouteNames.editProfile,
                          arguments: true,
                        );
                      })
                ],
              ),
              60.ph,
              Column(
                children: [
                  const CustomAuthDividerWidget(label: 'yoki davom eting'),
                  20.ph,
                  const SocialAuthButtons(),
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
      ),
    );
  }
}
