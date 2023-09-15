import 'package:flutter/material.dart';
import 'package:taxi_app/ui/auth/login/login_screen.dart';
import 'package:taxi_app/ui/splash/splash_screen.dart';

import 'auth/lets_in/lets_in_screen.dart';

class RouteNames {
  static const String splashScreen = "/";
  static const String letsIn = "lets_in_screen";
  static const String signUp = "sign_up_screen";
  static const String login = "login_screen";
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
          builder: (context) => const LestInScreen(),
        );
      case RouteNames.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text("Route not found!")),
          ),
        );
    }
  }
}
