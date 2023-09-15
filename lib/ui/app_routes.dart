import 'package:flutter/material.dart';
import 'package:taxi_app/ui/splash/splash_screen.dart';

class RouteNames {
  static const String splashScreen = "/";
  static const String conFirmCodeScreen="/conFirmCodeScreen";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
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
