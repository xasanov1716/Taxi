import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

class SetPinScreen extends StatefulWidget {
  const SetPinScreen({super.key, this.previousPin});

  final String? previousPin;

  @override
  State<SetPinScreen> createState() => _SetPinScreenState();
}

class _SetPinScreenState extends State<SetPinScreen> {
  String currentPin = '';
  final TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: GlobalAppBar(
        title: widget.previousPin == null
            ? "Pinkodni o'rnatish"
            : "Pinkodni tasdiqlang",
        onTap: widget.previousPin != null
            ? () {
                Navigator.pop(context);
                Navigator.pushNamed(
                  context,
                  RouteNames.setPinCodeScreen,
                  arguments: null,
                );
              }
            : null,
      ),
      body: ListView(
        padding: EdgeInsets.all(width / 16),
        children: [
          (height/8).ph,
          Text(
            widget.previousPin == null
                ? "Yangi parolni kiriting"
                : "Yangi parolni tasdiqlash uchun qayta kiriting!",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontSize: 20.sp),
          ),
          (height/8).ph,
          LocalAuthPinput(
            pinPutController: pinController,
            onCompleted: _onPinSubmit,
          ),
          (height/20).ph,
          GlobalButton(
            color: AppColors.primary,
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

  void _onPinSubmit(String pin) {
    if (widget.previousPin == null) {
      Navigator.pop(context);
      Navigator.pushNamed(
        context,
        RouteNames.setPinCodeScreen,
        arguments: pin,
      );
    } else {
      if (pin != widget.previousPin) {
        showErrorMessage(message: tr('forgot.wrong'), context: context);
      } else {
        if (pin.length == 4) {
          StorageRepository.putString(
            StorageKeys.pinCode,
            pin,
          );
          Navigator.pushReplacementNamed(context, RouteNames.setBiometrics);
        } else {
          showErrorMessage(
            message: tr('set_pin_code.pin_is_empty'),
            context: context,
          );
        }
      }
    }
    pinController.text = '';
  }
}
