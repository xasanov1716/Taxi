import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_auth/local_auth.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/local_auth/widgets/local_auth_pinput.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/constants/storage_keys.dart';
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
      appBar: const GlobalAppBar(title: "Pin codeni kiriting!"),
      body: ListView(
        padding: EdgeInsets.all(width / 16),
        children: [
          (height / 8).ph,
          Text(
            "Parolni kiriting!",
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
            title: 'Continue',
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

  void validatePin(String pin) {
    if (pin == StorageRepository.getString(StorageKeys.pinCode)) {
      Navigator.pushReplacementNamed(context, RouteNames.tabBox);
    } else {
      showErrorMessage(
        message: "Pin kod xato",
        context: context,
      );
    }
  }
}
