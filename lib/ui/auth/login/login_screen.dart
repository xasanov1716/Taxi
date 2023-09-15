import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/ui/auth/widgets/auth_text_field.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Padding(
      padding:
          EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h, bottom: 48.h),
      child: Column(
        children: [
          Text(
            "Login to your Account",
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 48.sp,
                ),
          ),
          AuthTextField(hintText: "Telefon raqam",prefixIcon: AppIcons.call,),
          AuthTextField(hintText: "Parol",prefixIcon: AppIcons.lock,isPassword: true,),
        ],
      ),
    ));
  }
}
