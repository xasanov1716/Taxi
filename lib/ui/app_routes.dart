import 'package:flutter/material.dart';
import 'package:taxi_app/ui/account/profile_screen.dart';
import 'package:taxi_app/ui/home/home_screen.dart';
import 'package:taxi_app/ui/splash/splash_screen.dart';
import 'package:taxi_app/ui/tab_box/tab_box.dart';

class RouteNames {
  static const String splashScreen = "/";
  static const String tabBox = "tab_box";
  static const String profileScreen = "profile_screen";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case RouteNames.tabBox:
        return MaterialPageRoute(
          builder: (context) => const TabBox(),
        );
      case RouteNames.profileScreen:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
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
