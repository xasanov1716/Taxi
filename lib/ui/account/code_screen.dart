import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';

class CodeScreen extends StatefulWidget {
  const CodeScreen({super.key});

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();

    const focusedBorderColor = Colors.blue;
    const fillColor = AppColors.c_50;
    const borderColor = AppColors.c_200;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 24,
        color: AppColors.black,
      ),
      padding: const EdgeInsets.only(left: 32, right: 32, top: 16, bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 2),
      ),
    );

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.white,
          title: const Text(
            "Создать новый PIN-код",
            style: TextStyle(
              fontFamily: "Urbanist",
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xff212121),
              height: 29/24,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            children: [
              Expanded(
                  child: ListView(
                children: [
                  const SizedBox(
                    height: 115,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add a PIN number to make your account\n                    more secure.',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Directionality(
                          // Specify direction if desired
                          textDirection: TextDirection.ltr,
                          child: Pinput(
                            length: 4,
                            controller: codeController,
                            focusNode: focusNode,
                            androidSmsAutofillMethod:
                                AndroidSmsAutofillMethod.smsUserConsentApi,
                            listenForMultipleSmsOnAndroid: true,
                            defaultPinTheme: defaultPinTheme,
                            separatorBuilder: (index) =>
                                const SizedBox(width: 8),
                            hapticFeedbackType: HapticFeedbackType.lightImpact,
                            cursor: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 9),
                                  width: 22,
                                  height: 1,
                                  color: focusedBorderColor,
                                ),
                              ],
                            ),
                            focusedPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!.copyWith(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: focusedBorderColor),
                              ),
                            ),
                            submittedPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!.copyWith(
                                color: fillColor,
                                borderRadius: BorderRadius.circular(19),
                                border: Border.all(color: focusedBorderColor),
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
              Padding(
                padding: const EdgeInsets.all(24),
                child: GlobalButton(
                    color: AppColors.primary,
                    title: 'Continue',
                    radius: 100,
                    textColor: AppColors.white,
                    onTap: () {
                      if (codeController.text.isNotEmpty) {
                        StorageRepository.putString('code', codeController.text);
                      }
                      Navigator.pushNamed(context, RouteNames.fingerprintScreen);
                    }),
              ),
            ],
          ),
        ));
  }
}
