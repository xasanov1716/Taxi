import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:taxi_app/ui/forget_create_passwords/create_screen/widgets/checkbox.dart';
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
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: ListView(
          padding:
              EdgeInsets.only(top: 24.h, bottom: 48.h, left: 24.w, right: 24.w),
          children: [
            Column(
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
                      prefixIcon: AppIcons.lock,
                      caption: '',
                      controller: passwordController,
                    ),
                    SizedBox(height: 24.h),
                    GlobalTextField(
                      hintText: 'Repeat password',
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      prefixIcon: AppIcons.lock,
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
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          contentPadding: EdgeInsets.only(
                            top: 32.h,
                            left: 32.w,
                            right: 32.w,
                          ),
                          content: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32.h),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(AppIcons.createNewPasswordDialog),
                                SizedBox(
                                  height: 32.h,
                                ),
                                Text(
                                  'Congratulations!',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.sp,
                                  ),
                                ),
                                SizedBox(height: 16.h),
                                Center(
                                  child: Text(
                                    'Your account is ready to use. You will be redirected to the Home page in a few seconds..!',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      letterSpacing: 0.2,
                                      fontFamily: "Urbanist",
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 32.h,
                                ),
                                SizedBox(
                                  height: 120.h,
                                  child: LottieBuilder.asset(
                                      AppIcons.splashCircular),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}