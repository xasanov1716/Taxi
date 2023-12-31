import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/restore_password/widgets/forgot_password_selector.dart';
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
          title: tr('forgot_password')),
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
                    AdaptiveTheme.of(context).theme == AdaptiveTheme.of(context).darkTheme
                        ? AppIcons.forgotPasswordDarkImage
                        : AppIcons.enterPassword,
                    height: height * 0.285,
                    width: width * 0.64,
                  ),
                  24.ph,
                  Text(
                      tr('select_which_contact_password'),
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontSize: 18.sp, letterSpacing: 0.2.w)),
                  24.ph,
                  ForgotPasswordSelector(
                    title: '${tr('via_sms')}:',
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
                    title:'${tr('via_email')}:',
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
              title: tr('continue'),
              radius: 29.r,
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
