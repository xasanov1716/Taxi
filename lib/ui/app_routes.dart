import 'package:flutter/material.dart';
import 'package:taxi_app/ui/account/profile_screen.dart';
import 'package:taxi_app/ui/acount_setup/subscreen/code_screen.dart';
import 'package:taxi_app/ui/acount_setup/subscreen/fill_profile.dart';
import 'package:taxi_app/ui/splash/splash_screen.dart';
import 'package:taxi_app/ui/tab_box/tab_box.dart';

class RouteNames {
  static const String splashScreen = "/";
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

      case RouteNames.fillProfile:
        return MaterialPageRoute(
          builder: (context) => const FillProfileScreen(),
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
