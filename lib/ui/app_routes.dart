import 'package:flutter/material.dart';

import 'package:taxi_app/ui/account/code_screen.dart';
import 'package:taxi_app/ui/account/fingerprint_screen.dart';
import 'package:taxi_app/ui/account/fill_profile.dart';
import 'package:taxi_app/ui/forget_create_passwords/create_screen/create_password_screen.dart';
import 'package:taxi_app/ui/forget_create_passwords/forget_screen/confirm_code_screen.dart';
import 'package:taxi_app/ui/forget_create_passwords/forget_screen/forget_password_screen.dart';
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
  static const String codeScreen = "code_screen";
  static const String fingerprintScreen = "fingerprint_creen";
  static const String fillProfile = "/profile";
  static const String code = "/code";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case RouteNames.letsIn:
        return MaterialPageRoute(
          builder: (context) => const LetsInScreen(),
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
          builder: (context) => const FillProfileScreen(),
        );

      case RouteNames.fillProfile:
        return MaterialPageRoute(
          builder: (context) => const FillProfileScreen(),
        );
      case RouteNames.codeScreen:
        return MaterialPageRoute(
          builder: (context) => const CodeScreen(),
        );

      case RouteNames.fingerprintScreen:
        return MaterialPageRoute(
            builder: (context) => const FingerprintScreen());
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
