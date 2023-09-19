import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:taxi_app/blocs/search_location_bloc/places_bloc.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/restore_password/create_screen/widgets/restorePasswordSuccess.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/restore_password/widgets/checkbox.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/ui/widgets/global_input.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class CreatePasswordScreen extends StatefulWidget {
  CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode repeatFocusNode = FocusNode();
  bool isPressed = false;
  bool isPressed2 = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: GlobalAppBar(
        onTap: () {
          Navigator.pop(context);
        },
        title: "Create New Password",
      ),
      body: ListView(
        padding: EdgeInsets.only(
            left: width * 24 / figmaWidth, right: width * 24 / figmaWidth),
        children: [
          70.ph,
          Image.asset(
            AdaptiveTheme.of(context).theme ==
                    AdaptiveTheme.of(context).darkTheme
                ? AppIcons.createNewPasswordDarkImage
                : AppIcons.successPassword,
            height: height * (250 / figmaHeight),
            width: width * (329 / figmaWidth),
          ),
          Text(
            "Create Your New Password",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
          ),
          24.ph,
          GlobalTextField(
            focusNode: passwordFocusNode,
            suffixIcon: IconButton(
              splashColor: null,
              splashRadius: 2,
              onPressed: () {
                setState(() {
                  isPressed = !isPressed;
                });
              },
              icon: SvgPicture.asset(
                isPressed
                    ? AppIcons.getSvg(
                        name: AppIcons.show, iconType: IconType.bold)
                    : AppIcons.getSvg(
                        name: AppIcons.hide, iconType: IconType.bold),
                colorFilter: ColorFilter.mode(
                    AdaptiveTheme.of(context).theme ==
                            AdaptiveTheme.of(context).darkTheme
                        ? AppColors.white
                        : AppColors.c_900,
                    BlendMode.srcIn),
              ),
            ),
            hintText: 'Password',
            obscureText: !isPressed,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.next,
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 15.w, right: 12.w),
              child: SvgPicture.asset(
                AppIcons.getSvg(
                  name: AppIcons.lock,
                  iconType: IconType.bold,
                ),
                colorFilter: ColorFilter.mode(
                    getTheme(context) ? AppColors.white : AppColors.c_900,
                    BlendMode.srcIn),
              ),
            ),
            caption: '',
            controller: passwordController,
          ),
          24.ph,
          GlobalTextField(
            focusNode: repeatFocusNode,
            suffixIcon: IconButton(
                splashColor: null,
                splashRadius: 2,
                onPressed: () {
                  setState(() {
                    isPressed2 = !isPressed2;
                  });
                },
                icon: SvgPicture.asset(
                  isPressed2
                      ? AppIcons.getSvg(
                          name: AppIcons.show, iconType: IconType.bold)
                      : AppIcons.getSvg(
                          name: AppIcons.hide, iconType: IconType.bold),
                  colorFilter: ColorFilter.mode(
                      AdaptiveTheme.of(context).theme ==
                              AdaptiveTheme.of(context).darkTheme
                          ? AppColors.white
                          : AppColors.c_900,
                      BlendMode.srcIn),
                )),
            hintText: 'Repeat password',
            obscureText: !isPressed2,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 15.w, right: 12.w),
              child: SvgPicture.asset(
                AppIcons.getSvg(name: AppIcons.lock, iconType: IconType.bold),
                colorFilter: ColorFilter.mode(
                    getTheme(context) ? AppColors.white : AppColors.c_900,
                    BlendMode.srcIn),
              ),
            ),
            caption: '',
            controller: repeatPasswordController,
          ),
          24.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ForgetPasswordCheckbox(),
              Text("Remember me",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith()),
            ],
          ),
          71.ph,
          GlobalButton(
            color: AppColors.primary,
            title: 'Continue',
            radius: 50.r,
            textColor: AppColors.dark3,
            onTap: () {
              restorePasswordSuccess(context);
            },
          ),
        ],
      ),
    );
  }
}