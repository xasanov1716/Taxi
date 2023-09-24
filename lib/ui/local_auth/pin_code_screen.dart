import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_auth/local_auth.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/local_auth/widgets/pin_put_feild.dart';
import 'package:taxi_app/ui/widgets/global_alert_dialog.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/utils/constants/storage_keys.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

class PinCodeScreen extends StatefulWidget {
  const PinCodeScreen({super.key, this.isFromSecurity});
  final bool? isFromSecurity;

  @override
  State<PinCodeScreen> createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  final TextEditingController codeController = TextEditingController();
  final LocalAuthentication auth = LocalAuthentication();
  final FocusNode focusNode = FocusNode();
  String currentPin = '';
  bool authenticated = false;
  @override
  void initState() {
    currentPin = StorageRepository.getString(StorageKeys.pinCode);
    _checkBiometric();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const GlobalAppBar(title: "Pin codeni kiriting!"),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 48.h),
        child: PinPutField(isFromSecurity: widget.isFromSecurity),
      ),
    );
  }

  void _checkBiometric() async {
    try {
      authenticated = await auth.authenticate(
        localizedReason: 'Tasdiqlash uchun sensorga barmog\'ingizni bosing',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: false,
          biometricOnly: true,
        ),
      );
      debugPrint("AUTHENTICATED THEN:$authenticated");
    } catch (e) {
      debugPrint("error using biometric auth: $e");
      if (context.mounted) {
        //showErrorMessage(message: "Barmoq izini skanerlash xato!", context: context);
      }
    }
    setState(() {
      bool isAuth = StorageRepository.getBool("isAuth");
      if (isAuth && authenticated) {
        showGlobalAlertDialog(
            context: context,
            title: "Top Up Successful!",
            image: AppIcons.successPassword,
            text: "You have successfully top upe-wallet for \$120",
            onTap: () {});
        Navigator.pushReplacementNamed(context, RouteNames.tabBox);
      }
    });
  }
}
