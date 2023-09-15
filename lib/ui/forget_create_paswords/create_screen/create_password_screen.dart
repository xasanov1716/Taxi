import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi_app/ui/forget_create_paswords/create_screen/widgets/checkbox.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/ui/widgets/global_input.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

// ignore: must_be_immutable
class CreatePasswordScreen extends StatelessWidget {
  CreatePasswordScreen({super.key});
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(top: 24.h, bottom: 48.h, left: 24.w, right: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Row(
                children: [
                  IconButton(
                    onPressed: () {}, 
                    icon: SvgPicture.asset(AppIcons.arrowLeft),
                  ),
                  Text(
                    "Create New Password",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              Image.asset(
                AppIcons.successPassword,
                height: MediaQuery.of(context).size.height * (250 / 882),
                width: MediaQuery.of(context).size.width * (329 / 428),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create Your New Password",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w500,
                      color: AppColors.c_900,
                      letterSpacing: 0.2.sp,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  GlobalTextField(
                    hintText: 'Password',
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    prefixIcon: Icons.lock,
                    caption: '',
                    controller: passwordController,
                  ),
                  SizedBox(height: 24.h),
                  GlobalTextField(
                    hintText: 'Repeat password',
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    prefixIcon: Icons.lock,
                    caption: '',
                    controller: repeatPasswordController,
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const ForgetPasswordCheckbox(),
                      Text(
                        "Remember me",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w600,
                          color: AppColors.c_900,
                          letterSpacing: 0.2.sp,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              GlobalButton(
                color: AppColors.primary,
                title: 'Continue',
                radius: 100,
                textColor: AppColors.dark3,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
