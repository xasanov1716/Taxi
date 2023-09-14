import 'package:flutter/material.dart';
import 'package:taxi_app/ui/acount_setup/subscreen/code_screen.dart';
import 'package:taxi_app/ui/acount_setup/subscreen/fill_profile.dart';
import 'package:taxi_app/ui/splash/splash_screen.dart';

class RouteNames {
  static const String splashScreen = "/";
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
      case RouteNames.fillProfile:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        );
      case RouteNames.code:
        return MaterialPageRoute(
          builder: (context) => const CodeScreen(),
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
