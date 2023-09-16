import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/restore_password/widgets/forgot_password_selector.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class ForgotPassWord extends StatefulWidget {
  const ForgotPassWord({super.key});
  @override
  State<ForgotPassWord> createState() => _ForgotPassWordState();
}

class _ForgotPassWordState extends State<ForgotPassWord> {
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: GlobalAppBar(
          onTap: () {
            Navigator.pop(context);
          },
          title: 'Forgot Password'),
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  33.ph,
                  Image.asset(
                    AppIcons.enterPassword,
                    height: height * 0.285,
                    width: width * 0.64,
                  ),
                  24.ph,
                  Text(
                      'Select which contact details should we use to reset your password',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontSize: 18.sp, letterSpacing: 0.2.w)),
                  24.ph,
                  ForgotPasswordSelector(
                    title: 'via SMS:',
                    subtitle: '\n+1 111 ******99',
                    svg: 'assets/svg/bold/chat.svg',
                    onTap: () {
                      setState(() {
                        pressed = !pressed;
                      });
                    },
                    pressed: pressed,
                  ),
                  24.ph,
                  ForgotPasswordSelector(
                    title: 'via Email:',
                    subtitle: '\nand***ley@yourdomain.com',
                    svg: 'assets/svg/bold/message.svg',
                    onTap: () {
                      setState(() {
                        pressed = !pressed;
                      });
                    },
                    pressed: !pressed,
                  ),
                ],
              ),
            ),
            24.ph,
            GlobalButton(
              color: AppColors.disabledButton,
              leftIcon: "",
              rightIcon: "",
              title: 'Continue',
              radius: 29.r,
              textColor: AppColors.dark3,
              onTap: () {
                Navigator.pushNamed(context, RouteNames.conFirmCodeScreen);
              },
            )
          ],
        ),
      ),
    );
  }
}
