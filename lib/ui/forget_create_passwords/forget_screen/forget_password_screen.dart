import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

class ForgotPassWord extends StatefulWidget {
  const ForgotPassWord({super.key});

  @override
  State<ForgotPassWord> createState() => _ForgotPassWordState();
}

class _ForgotPassWordState extends State<ForgotPassWord> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            AppIcons.arrowLeft,
            colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
          ),
        ),
        title: Text(
          'Forgot Password',
          style: TextStyle(
              color: AppColors.c_900,
              fontFamily: 'Urbanist',
              fontStyle: FontStyle.normal,
              fontSize: 24.sp,
              fontWeight: FontWeight.w700),
        ),
        centerTitle: false,
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.049,
              left: MediaQuery.of(context).size.width * 0.18,
              right: MediaQuery.of(context).size.width * 0.18,
            ),
            child: Image.asset(
              AppIcons.enterPassword,
              height: MediaQuery.of(context).size.height * 0.285,
              width: MediaQuery.of(context).size.width * 0.64,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.044,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.height * 0.05,
            ),
            child: Text(
              'Select which contact details should we use to reset your password',
              style: TextStyle(
                color: AppColors.c_900,
                fontFamily: 'Urbanist',
                fontStyle: FontStyle.normal,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.2.w,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.0272,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  pressed = !pressed;
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                      color: pressed
                          ? AppColors.disabledButton
                          : AppColors.c_900.withOpacity(0.3),
                      width: 2.w),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.0272,
                    left: MediaQuery.of(context).size.width * 0.05,
                    right: MediaQuery.of(context).size.width * 0.05,
                    bottom: MediaQuery.of(context).size.height * 0.0272,
                  ),
                  child: Row(
                    children: [
                      Container(
                          height: 80.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40.r),
                              color: AppColors.yellowBackground),
                          child: IconButton(
                            onPressed: null,
                            icon: SvgPicture.asset(
                              'assets/svg/bold/chat.svg',
                              colorFilter: const ColorFilter.mode(
                                  AppColors.disabledButton, BlendMode.srcIn),
                            ),
                          )),
                      SizedBox(
                        width: 20.w,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'via SMS:',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.sp,
                              fontFamily: 'Urbanist',
                              letterSpacing: 0.2.w,
                              color: AppColors.c_600),
                          children: <TextSpan>[
                            TextSpan(
                              text: '\n+1 111 ******99',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                  fontFamily: 'Urbanist',
                                  letterSpacing: 0.2.w,
                                  color: AppColors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.0272,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
              bottom: MediaQuery.of(context).size.height * 0.0272,
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  pressed = !pressed;
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                      color: !pressed
                          ? AppColors.disabledButton
                          : AppColors.c_900.withOpacity(0.3),
                      width: 2.w),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.0272,
                    left: MediaQuery.of(context).size.width * 0.05,
                    right: MediaQuery.of(context).size.width * 0.05,
                    bottom: MediaQuery.of(context).size.height * 0.0272,
                  ),
                  child: Row(
                    children: [
                      Container(
                          height: 80.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40.r),
                              color: AppColors.yellowBackground),
                          child: IconButton(
                            onPressed: null,
                            icon: SvgPicture.asset(
                              'assets/svg/bold/message.svg',
                              colorFilter: const ColorFilter.mode(
                                  AppColors.disabledButton, BlendMode.srcIn),
                            ),
                          )),
                      SizedBox(
                        width: 20.w,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'via Email:',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.sp,
                              fontFamily: 'Urbanist',
                              letterSpacing: 0.2.w,
                              color: AppColors.c_600),
                          children: <TextSpan>[
                            TextSpan(
                              text: '\nand***ley@yourdomain.com',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                  fontFamily: 'Urbanist',
                                  letterSpacing: 0.2.w,
                                  color: AppColors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.0272,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
            ),
            child: GlobalButton(
              color: AppColors.disabledButton,
              leftIcon: "",
              rightIcon: "",
              title: 'Continue',
              radius: 29.r,
              textColor: AppColors.dark3,
              onTap: () {
                Navigator.pushNamed(context, RouteNames.conFirmCodeScreen);
              },
            ),
          ),
        ],
      ),
    );
  }
}
