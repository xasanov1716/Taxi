import 'package:flutter/material.dart';
import 'package:taxi_app/ui/home/home_screen.dart';
import 'package:taxi_app/ui/splash/splash_screen.dart';

import 'auth/lets_in/lets_in_screen.dart';

class RouteNames {
  static const String splashScreen = "/";
  static const String lestIn = "lest_in_screen";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case RouteNames.lestIn:
        return MaterialPageRoute(
          builder: (context) =>const LestInScreen (),
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
