import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/icons/app_icons.dart';
import 'auth_text_field.dart';

class LoginMiddleBody extends StatelessWidget {
  const LoginMiddleBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthTextField(hintText: "Telefon raqam",prefixIcon: AppIcons.call,),
        24.ph,
        AuthTextField(hintText: "Parol",prefixIcon: AppIcons.lock,isPassword: true,),
        24.ph,
        GlobalButton(color: AppColors.primary, radius:100.r,textColor: AppColors.dark3, title: "Sign in", onTap: (){}),
        24.ph,
        TextButton(onPressed: (){}, child: Text("Forgot the password?",style: Theme.of(context).textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w600, color: AppColors.primary
        ),))

      ],
    );
  }
}
