import 'package:flutter/material.dart';
import 'package:taxi_app/ui/forget_create_paswords/create_screen/create_password_screen.dart';
import 'package:taxi_app/ui/forget_create_paswords/forget_screen/confirm_code_screen.dart';
import 'package:taxi_app/ui/forget_create_paswords/forget_screen/forget_password_screen.dart';
import 'package:taxi_app/ui/splash/splash_screen.dart';

class RouteNames {
  static const String splashScreen = "/";
  static const String conFirmCodeScreen = "/conFirmCodeScreen";
  static const String forgotPassword = "/forgotPassword";
  static const String createPassword = "/createPassword";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
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
