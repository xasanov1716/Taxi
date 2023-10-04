import 'package:flutter/material.dart';
import 'package:taxi_app/data/models/address_model/address_model.dart';
import 'package:taxi_app/data/models/notification_model/notification_model.dart';
import 'package:taxi_app/ui/app/app.dart';
import 'package:taxi_app/ui/chat/chat_screen.dart';
import 'package:taxi_app/ui/contact_to_driver/sub_screens/cancel_driver/cancel_driver_screen.dart';
import 'package:taxi_app/ui/contact_to_driver/sub_screens/driver_detail/driver_detail_screen.dart';
import 'package:taxi_app/ui/create_order/sub_screens/add_promo/add_promo_screen.dart';
import 'package:taxi_app/ui/create_order/sub_screens/driver_arriving/driver_arriving_screen.dart';
import 'package:taxi_app/ui/create_order/sub_screens/payment_methods/payment_methods_screen.dart';
import 'package:taxi_app/ui/create_order/sub_screens/searching_driver/searching_driver_screen.dart';
import 'package:taxi_app/ui/create_order/sub_screens/select_transport/select_transport_screen.dart';
import 'package:taxi_app/ui/enterance/welcome/welcome_screen.dart';
import 'package:taxi_app/ui/tab_box/home/bottom_sheet/bottom_sheet_screen.dart';
import 'package:taxi_app/ui/tab_box/home/notification/notification_detail_screen.dart';
import 'package:taxi_app/ui/tab_box/home/notification/notification_screen.dart';
import 'package:taxi_app/ui/tab_box/home/notification/screen/send_notification_screen.dart';
import 'package:taxi_app/ui/tab_box/home/sub_screens/request_screens/request_screen.dart';
import 'package:taxi_app/ui/tab_box/home/sub_screens/search_location/search_location_screen.dart';
import 'package:taxi_app/ui/tab_box/profile/profile_screen.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/address/address_add_screen.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/address/address_screen.dart';
import 'package:taxi_app/ui/auth/login/login_screen.dart';
import 'package:taxi_app/ui/auth/register/register_screen.dart';
import 'package:taxi_app/ui/splash/splash_screen.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/edit_profile_client/edit_profile_client.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/edit_profile_driver/edit_profile_screen.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/help_center/help_center_screen.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/invite_friends/invite_friends.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/language/language_screen.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/notification/control_notification_screen.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/payments/payment_add_card_screen.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/payments/payment_screen.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/privacy_policy/privacy_policy_screen.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/restore_password/create_screen/create_password_screen.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/restore_password/forget_screen/confirm_code_screen.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/restore_password/forget_screen/forget_password_screen.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/security/security_screen.dart';
import 'package:taxi_app/ui/tab_box/tab_box.dart';
import 'package:taxi_app/ui/tab_box/wallet/sub_screens/top_up_amount_screen.dart';
import 'package:taxi_app/ui/tab_box/wallet/sub_screens/top_up_payment_screen.dart';
import 'package:taxi_app/ui/tab_box/wallet/sub_screens/transaction_detail_screen.dart';
import 'package:taxi_app/ui/tab_box/wallet/sub_screens/transaction_history_screen.dart';
import 'auth/lets_in/lets_in_screen.dart';
import 'tab_box/home/sub_screens/special_offers/special_offers_screen.dart';

class RouteNames {
  static const String splashScreen = "/";
  static const String conFirmCodeScreen = "/confirm_code_screen";
  static const String appRoute = "/app_route";
  static const String forgotPassword = "/forgot_password";
  static const String createPassword = "/create_password";
  static const String letsIn = "/lets_in_screen";
  static const String signUp = "/sign_up_screen";
  static const String login = "/login_screen";
  static const String tabBox = "/tab_box";
  static const String profileScreen = "/profile_screen";
  // static const String setPinCodeScreen = "/set_pin_code_screen";
  // static const String enterPinScreen = "/pin_code_screen";
  // static const String setBiometrics = "/set_biometrics";
  static const String code = "/code";
  static const String searchLocationScreen = "/search_location";
  static const String notificationScreen = "/notification_screen";
  static const String specialOffers = "/special_offers";
  static const String paymentMethods = "/payment_methods";
  static const String searchingDriver = "/searching_driver";
  static const String driverArriving = "/driver_arriving";
  static const String selectTransportScreen = "/select_driver_screen";
  static const String bottomSheetDialog = "/bottom_sheet_dialog";
  static const String addPromo = "/add_promo";
  static const String cancelDriver = "/cancel_driver";
  static const String chatWithDriver = "/chat_with_driver";
  static const String driverDetail = "/driver_detail";
  static const String notificationSwitch = "/notification_switch";
  static const String topUpAmountScreen = "/top_up_amount_screen";
  static const String addressScreen = "/address";
  static const String topUpPaymentScreen = "/top_up_payment_screen";
  static const String transactionsHistory = "/transaction_histories";
  static const String transactionsDetail = "/transaction_detail";
  static const String languageScreen = "/language_screen";
  static const String security = "/security";
  static const String privacyPolicy = "/privacy_policy";
  static const String payment = "/payment_screen";
  static const String paymentAddCard = "/payment_add_card_screen";
  static const String editProfileDriver = "/edit_profile";
  static const String editProfileClient = "/edit_profile_client";
  static const String inviteFriends = "/invite_friends";
  static const String welcomeScreen = "/welcome";
  static const String helpCenterScreen = "/helpCenterScreen";
  static const String askRoleDialog = "/askRoleDialog";
  static const String notificationDetail = "/notificationDetail";
  static const String sendNotificationScreen = "/sendNotificationScreen";
  static const String addAddressScreen = "/add_address_screen";
  static const String requestScreen = "/request_screen";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case RouteNames.requestScreen:
        return MaterialPageRoute(
          builder: (context) => const RequestScreen(),
        );
      case RouteNames.welcomeScreen:
        return MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        );
      case RouteNames.helpCenterScreen:
        return MaterialPageRoute(
          builder: (context) => const HelpCenterScreen(),
        );
      case RouteNames.editProfileDriver:
        return MaterialPageRoute(
          builder: (context) => EditProfileScreen(
            navigateFromAuth: settings.arguments as bool,
          ),
        );
      case RouteNames.specialOffers:
        return MaterialPageRoute(
          builder: (context) => const SpecialOffersScreen(),
        );
      case RouteNames.appRoute:
        return MaterialPageRoute(
          builder: (context) => const App(),
        );
      case RouteNames.inviteFriends:
        return MaterialPageRoute(
          builder: (context) => const InviteFriendsScreen(),
        );
      case RouteNames.security:
        return MaterialPageRoute(
          builder: (context) => const SecurityScreen(),
        );
      case RouteNames.languageScreen:
        return MaterialPageRoute(
          builder: (context) => const LanguageScreen(),
        );
      case RouteNames.letsIn:
        return MaterialPageRoute(
          builder: (context) => const LetsInScreen(),
        );
      case RouteNames.cancelDriver:
        return MaterialPageRoute(
          builder: (context) => const CancelDriverScreen(),
        );
      case RouteNames.privacyPolicy:
        return MaterialPageRoute(
          builder: (context) => const PrivacyPolicyScreen(),
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
      // case RouteNames.setPinCodeScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => SetPinScreen(
      //       previousPin: settings.arguments as String?,
      //     ),
      //   );
      // case RouteNames.enterPinScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => EnterPinScreen(isFromSecurity: settings.arguments as bool?),
      //   );
      case RouteNames.driverDetail:
        return MaterialPageRoute(
          builder: (context) => const DriverDetailScreen(),
        );

      case RouteNames.topUpAmountScreen:
        return MaterialPageRoute(
          builder: (context) => const TopUpAmountScreen(),
        );

      case RouteNames.addAddressScreen:
        return MaterialPageRoute(
          builder: (context) => AddressAddDetailScreen(
            addressModel: settings.arguments as AddressModel?,
          ),
        );
      // case RouteNames.setBiometrics:
      //   return MaterialPageRoute(builder: (context) => const SetBiometricsScreen());
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
      case RouteNames.notificationScreen:
        return MaterialPageRoute(
          builder: (context) => NotificationScreen(),
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
            builder: (context) => const SelectTransportScreen());
      case RouteNames.chatWithDriver:
        return MaterialPageRoute(
          builder: (context) => const ChatScreen(),
        );
      case RouteNames.bottomSheetDialog:
        return MaterialPageRoute(
          builder: (context) => const BottomSheetScreen(),
        );
      case RouteNames.notificationSwitch:
        return MaterialPageRoute(
          builder: (context) => const ControlNotificationScreen(),
        );
      case RouteNames.topUpPaymentScreen:
        return MaterialPageRoute(
          builder: (context) => const TopUpPaymentScreen(),
        );
      case RouteNames.transactionsHistory:
        return MaterialPageRoute(
          builder: (context) => const TransactionHistoryScreen(),
        );
      case RouteNames.transactionsDetail:
        return MaterialPageRoute(
          builder: (context) => const TransactionDetailScreen(),
        );
      case RouteNames.addressScreen:
        return MaterialPageRoute(
          builder: (context) => const AddressScreen(),
        );
      case RouteNames.payment:
        return MaterialPageRoute(
          builder: (context) => const PaymentsListScreen(),
        );
      case RouteNames.paymentAddCard:
        return MaterialPageRoute(
          builder: (context) => const PaymentAddCardScreen(),
        );
      case RouteNames.sendNotificationScreen:
        return MaterialPageRoute(
          builder: (context) => SendNotificationScreen(),
        );
      case RouteNames.notificationDetail:
        return MaterialPageRoute(
          builder: (context) => NotificationDetailScreen(
              notification: settings.arguments as NotificationModel),
        );
      case RouteNames.editProfileClient:
        return MaterialPageRoute(
          builder: (context) => EditProfileClientScreen(
            navigateFromAuth: settings.arguments as bool,
          ),
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
