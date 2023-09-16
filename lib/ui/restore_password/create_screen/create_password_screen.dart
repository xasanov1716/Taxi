import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:taxi_app/ui/restore_password/widgets/checkbox.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/ui/widgets/global_input.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
// ignore: must_be_immutable
class CreatePasswordScreen extends StatelessWidget {
  CreatePasswordScreen({super.key});

  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode repeatFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: GlobalAppBar(
        onTap: () {
          Navigator.pop(context);
        },
        title: "Create New Password",
      ),
      body: ListView(
        padding: EdgeInsets.only(left: width*24/figmaWidth,right:width*24/figmaWidth ),
        children: [
          70.ph,
          Image.asset(
            AppIcons.successPassword,
            height: height * (250 / figmaHeight),
            width: width * (329 / figmaWidth),
          ),
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
           24.ph,
          GlobalTextField(
            hintText: 'Password',
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.next,
            prefixIcon: AppIcons.lock,
            caption: '',
            controller: passwordController,
          ),
          24.ph,
          GlobalTextField(
            hintText: 'Repeat password',
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            prefixIcon: AppIcons.lock,
            caption: '',
            controller: repeatPasswordController,
          ),
          24.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ForgetPasswordCheckbox(),
              Text(
                "Remember me",
                style:Theme.of(context).textTheme.labelLarge!.copyWith() ),

            ],
          ),
           71.ph,
          GlobalButton(
            color: AppColors.primary,
            title: 'Continue',
            radius: 50.r,
            textColor: AppColors.dark3,
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    contentPadding: EdgeInsets.only(
                      top: 32*height/figmaHeight,
                      left: 32*width/figmaWidth,
                      right: 32*width/figmaWidth,
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
                          32.ph,
                          Text(
                            'Congratulations!',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24.sp,
                            ),
                          ),
                            16.ph,
                          Center(
                            child: Text(
                              'Your account is ready to use. You will be redirected to the Home page in a few seconds..!',
                              style: TextStyle(
                                fontSize: 16.sp,
                                letterSpacing: 0.2.w,
                                fontFamily: "Urbanist",
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          32.ph,
                          SizedBox(
                            height: 120*height/figmaHeight,
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
    );
  }
}
