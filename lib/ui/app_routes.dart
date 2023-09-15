import 'package:flutter/material.dart';
import 'package:taxi_app/ui/forget_create_paswords/create_screen/create_password_screen.dart';
import 'package:taxi_app/ui/forget_create_paswords/forget_screen/confirm_code_screen.dart';
import 'package:taxi_app/ui/forget_create_paswords/forget_screen/forget_password_screen.dart';
import 'package:taxi_app/ui/account/profile_screen.dart';
import 'package:taxi_app/ui/acount_setup/subscreen/code_screen.dart';
import 'package:taxi_app/ui/acount_setup/subscreen/fill_profile.dart';
import 'package:taxi_app/ui/auth/login/login_screen.dart';
import 'package:taxi_app/ui/auth/register/register_screen.dart';

import 'package:taxi_app/ui/splash/splash_screen.dart';
import 'package:taxi_app/ui/tab_box/tab_box.dart';

import 'auth/lets_in/lets_in_screen.dart';

class RouteNames {
  static const String splashScreen = "/";
  static const String conFirmCodeScreen = "/conFirmCodeScreen";
  static const String forgotPassword = "/forgotPassword";
  static const String createPassword = "/createPassword";
  static const String letsIn = "lets_in_screen";
  static const String signUp = "sign_up_screen";
  static const String login = "login_screen";
  static const String tabBox = "tab_box";
  static const String profileScreen = "profile_screen";
  static const String fillProfile = "/profile";
  static const String code = "/code";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const LestInScreen(),
        );
      case RouteNames.letsIn:
        return MaterialPageRoute(
          builder: (context) => const LestInScreen(),
        );
      case RouteNames.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RouteNames.signUp:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case RouteNames.tabBox:
        return MaterialPageRoute(
          builder: (context) => const TabBox(),
        );
      case RouteNames.profileScreen:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        );

      case RouteNames.fillProfile:
        return MaterialPageRoute(
          builder: (context) => const FillProfileScreen(),
        );
      case RouteNames.code:
        return MaterialPageRoute(
          builder: (context) => const CodeScreen(),
        );
      case RouteNames.conFirmCodeScreen:
        return MaterialPageRoute(
          builder: (context) => const ConfirmCodeScreen(),
        );
      case RouteNames.forgotPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgotPassWord(),
        );
      case RouteNames.createPassword:
        return MaterialPageRoute(
          builder: (context) => CreatePasswordScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text("Route not found!")),
          ),
        );
    }
  }
}
