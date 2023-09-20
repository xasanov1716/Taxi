import 'package:flutter/material.dart';
import 'package:taxi_app/ui/create_order/sub_screens/add_promo/add_promo_screen.dart';
import 'package:taxi_app/ui/create_order/sub_screens/driver_arriving/driver_arriving_screen.dart';
import 'package:taxi_app/ui/create_order/sub_screens/payment_methods/payment_methods_screen.dart';
import 'package:taxi_app/ui/create_order/sub_screens/searching_driver/searching_driver_screen.dart';
import 'package:taxi_app/ui/create_order/sub_screens/select_transport/select_transposrt_screen.dart';

import 'package:taxi_app/ui/local_auth/pin_code_screen.dart';
import 'package:taxi_app/ui/local_auth/biometrics_screen.dart';
import 'package:taxi_app/ui/local_auth/pin_code_set_screen_.dart';
import 'package:taxi_app/ui/tab_box/home/sub_screens/search_location/search_location_screen.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/edit_profile/edit_profile_screen.dart';
import 'package:taxi_app/ui/auth/login/login_screen.dart';
import 'package:taxi_app/ui/auth/register/register_screen.dart';
import 'package:taxi_app/ui/splash/splash_screen.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/restore_password/create_screen/create_password_screen.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/restore_password/forget_screen/confirm_code_screen.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/restore_password/forget_screen/forget_password_screen.dart';

import 'package:taxi_app/ui/tab_box/tab_box.dart';

import 'auth/lets_in/lets_in_screen.dart';
import 'tab_box/home/sub_screens/special_offers/special_offers_screen.dart';

class RouteNames {
  static const String splashScreen = "/";
  static const String conFirmCodeScreen = "/confirm_code_screen";
  static const String forgotPassword = "/forgot_password";
  static const String createPassword = "/create_password";
  static const String letsIn = "/lets_in_screen";
  static const String signUp = "/sign_up_screen";
  static const String login = "/login_screen";
  static const String tabBox = "/tab_box";
  static const String profileScreen = "/profile_screen";
  static const String setPinCodeScreen = "/set_pin_code_screen";
  static const String pinCodeScreen = "/pin_code_screen";
  static const String fingerprintScreen = "/finger_print";
  static const String fillProfile = "/profile";
  static const String code = "/code";
  static const String searchLocationScreen = "/search_location";
  static const String specialOffers = "/special_offers";
  static const String paymentMethods = "/payment_methods";
  static const String searchingDriver = "/searching_driver";
  static const String driverArriving = "/driver_arriving";
  static const String selectTransportScreen = "/select_driver_screen";
  static const String addPromo = "/add_promo";
}


class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case RouteNames.specialOffers:
        return MaterialPageRoute(
          builder: (context) => const SpecialOffersScreen(),
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
          builder: (context) => const EditProfileScreen(),
        );
      case RouteNames.fillProfile:
        return MaterialPageRoute(
          builder: (context) => const EditProfileScreen(),
        );
      case RouteNames.setPinCodeScreen:
        return MaterialPageRoute(
          builder: (context) => const PinCodeSetScreen(),
        );

      case RouteNames.pinCodeScreen:
        return MaterialPageRoute(
          builder: (context) => const PinCodeScreen(),
        );

      case RouteNames.fingerprintScreen:
        return MaterialPageRoute(
            builder: (context) => const BiometricsScreen());
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
          builder: (context) => const CreatePasswordScreen(),
        );
      case RouteNames.searchLocationScreen:
        return MaterialPageRoute(
          builder: (context) => const SearchLocationScreen(),
        );
      case RouteNames.paymentMethods:
        return MaterialPageRoute(
          builder: (context) => const PaymentMethodsScreen(),
        );
      case RouteNames.addPromo:
        return MaterialPageRoute(
          builder: (context) => const AddPromoScreen(),
        );
      case RouteNames.searchingDriver:
        return MaterialPageRoute(
          builder: (context) => const SearchingDriverScreen(),
        );
      case RouteNames.driverArriving:
        return MaterialPageRoute(
          builder: (context) => const DriverArrivingScreen(),
        );
      case RouteNames.selectTransportScreen:
        return MaterialPageRoute(
          builder: (context) => const SelectTransportScreen(),
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
