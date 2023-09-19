import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pinput/pinput.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/ui_utils/error_message_dialog.dart';

class PinCodeScreen extends StatefulWidget {
  const PinCodeScreen({super.key});

  @override
  State<PinCodeScreen> createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  final TextEditingController codeController = TextEditingController();
  final LocalAuthentication auth = LocalAuthentication();
  final FocusNode focusNode = FocusNode();
  String currentPin = '';

  @override
  void initState() {
    currentPin = StorageRepository.getString("code");
    _checkBiometric();
    super.initState();
  }

  void _checkBiometric() async {
    bool authenticated = false;
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
        showErrorMessage(
            message: "Barmoq izini skanerlash xato!", context: context);
      }
    }
    setState(() {
      bool isAuth = StorageRepository.getBool("isAuth");
      if (isAuth && authenticated) {
        Navigator.pushReplacementNamed(context, RouteNames.tabBox);
      }
    });
  }

  @override
  Widget build(BuildContext context) {



    final defaultPinTheme = PinTheme(
      height: 61,
      textStyle: TextStyle(
          fontSize: 24.sp, color: AppColors.c_900, fontWeight: FontWeight.w700),
      padding:
          EdgeInsets.only(left: 32.w, right: 32.w, top: 16.h, bottom: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.c_200, width: 2),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const GlobalAppBar(title: "Pin codeni kiriting!"),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 48.h),
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                115.ph,
                Center(
                  child: Text(
                    'Add a PIN number to make your account\n                    more secure.',
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ),
                80.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Pinput(
                          length: 4,
                          controller: codeController,
                          focusNode: focusNode,
                          androidSmsAutofillMethod:
                              AndroidSmsAutofillMethod.smsUserConsentApi,
                          listenForMultipleSmsOnAndroid: true,
                          defaultPinTheme: defaultPinTheme,
                          separatorBuilder: (index) => SizedBox(width: 4.w),
                          hapticFeedbackType: HapticFeedbackType.lightImpact,
                          cursor: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 9),
                                width: 10.w,
                                height: 1.h,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                          focusedPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.blue),
                            ),
                          ),
                          submittedPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              color: AppColors.c_50,
                              borderRadius: BorderRadius.circular(19),
                              border: Border.all(color: Colors.blue),
                            ),
                          ),
                          errorPinTheme: defaultPinTheme.copyBorderWith(
                            border: Border.all(color: Colors.redAccent),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),
            GlobalButton(
              color: AppColors.primary,
              title: 'Continue',
              radius: 100,
              textColor: AppColors.black,
              onTap: () {
                if (currentPin == codeController.text) {
                  Navigator.pushReplacementNamed(context, RouteNames.tabBox);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
