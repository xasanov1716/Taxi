import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/icons/app_icons.dart';

class LestInPage extends StatelessWidget {
  const LestInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
        children: [
24.ph,
            Image.asset(AppIcons.signIn),
          30.ph,
          Text("Let’s you in",style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 48)),30.5.ph,
          GlobalButton(color: AppColors.c_200, title: "Continue with Facebook", radius: 16, textColor: AppColors.c_900, rightIcon:AppIcons.facebook,onTap: (){}),
          16.ph,
          GlobalButton(color: AppColors.c_200, title: "Continue with Google", radius: 16, textColor: AppColors.c_900, rightIcon:AppIcons.google,onTap: (){}),
         16.ph,
          GlobalButton(color: AppColors.c_200, title: "Continue with Apple", radius: 16, textColor: AppColors.c_900, rightIcon:AppIcons.apple,onTap: (){}),
              24.ph,Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: AppColors.c_200,
                      height: 2.h,
                    ),
                  ),
                  9.pw,
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
                    child: Text(
                      "or",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppColors.c_700,fontSize: 18),
                    ),
                  ),
                  9.pw,
                  Expanded(
                    child: Divider(
                      color: AppColors.c_200,
                      height: 2.h,
                    ),
                  ),
                ],
              ),
          GlobalButton(color: AppColors.c_200, title: "Sign in with password", radius: 100, textColor: AppColors.primary, rightIcon:AppIcons.apple,onTap: (){}),

        ],
      ),
          )),
    );
  }
}
