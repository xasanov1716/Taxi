import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_auth/local_auth.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/local_auth/widgets/local_auth_pinput.dart';
import 'package:taxi_app/ui/widgets/global_alert_dialog.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/constants/storage_keys.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/ui_utils/error_message_dialog.dart';

class EnterPinScreen extends StatefulWidget {
  const EnterPinScreen({super.key, this.isFromSecurity});

  final bool? isFromSecurity;

  @override
  State<EnterPinScreen> createState() => _EnterPinScreenState();
}

class _EnterPinScreenState extends State<EnterPinScreen> {
  final TextEditingController codeController = TextEditingController();
  final LocalAuthentication auth = LocalAuthentication();
  final TextEditingController pinController = TextEditingController();

  bool authenticated = false;

  @override
  void initState() {
    // _checkBiometric();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:  GlobalAppBar(title: tr('enter_pin_code')),
      body: ListView(
        padding: EdgeInsets.all(width / 16),
        children: [
          (height / 8).ph,
          Text(tr('enter_code'),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontSize: 20.sp,
                ),
          ),
          (height / 8).ph,
          LocalAuthPinput(
            pinPutController: pinController,
            onCompleted: validatePin,
          ),
          (height / 20).ph,
          GlobalButton(
            color: AppColors.primary,
            title: tr('continue'),
            radius: 100,
            textColor: AppColors.black,
            onTap: () {
              Navigator.pushNamed(context, RouteNames.tabBox);
            },
          ),
        ],
      ),
    );
  }

  void _checkBiometric() async {
    try {
      authenticated = await auth.authenticate(
        localizedReason: tr('tap_your_finger_sensor'),
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: false,
          biometricOnly: true,
        ),
      );
      debugPrint("AUTHENTICATED THEN:$authenticated");
    } catch (e) {
      debugPrint("error using biometric auth: $e");
    }
    setState(
      () {
        bool isAuth = StorageRepository.getBool("isAuth");
        if (isAuth && authenticated) {
          showGlobalAlertDialog(
              context: context,
              title: tr('top_up_successful'),
              image: AppIcons.successPassword,
              text: "${tr('you_have_upe_wallet')} \$120",
              onTap: () {});
          Navigator.pushReplacementNamed(context, RouteNames.tabBox);
        }
      },
    );
  }

  void validatePin(String pin) {
    if (pin == StorageRepository.getString(StorageKeys.pinCode)) {
      Navigator.pushReplacementNamed(context, RouteNames.tabBox);
    } else {
      showErrorMessage(
        message: tr('error_pin_code'),
        context: context,
      );
    }
  }
}
