import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_auth/local_auth.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/local_auth/widgets/pin_put_feild.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';
import 'package:taxi_app/utils/ui_utils/error_message_dialog.dart';

class PinCodeSetScreen extends StatefulWidget {
  const PinCodeSetScreen({super.key});

  @override
  State<PinCodeSetScreen> createState() => _PinCodeSetScreenState();
}

class _PinCodeSetScreenState extends State<PinCodeSetScreen> {
  final LocalAuthentication auth = LocalAuthentication();
  String currentPin = '';
  final List<FocusNode> pinFocusNodes = List.generate(4, (_) => FocusNode());
  final List<TextEditingController> pinControllers =
      List.generate(4, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const GlobalAppBar(title: "Create New PIN"),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 48.h),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  60.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(4, (index) {
                      return SizedBox(
                        width: 85.0.w,
                        child: TextField(
                          style: Theme.of(context)
                              .appBarTheme
                              .titleTextStyle!
                              .copyWith(fontSize: 20.sp),
                          onTap: () {
                            setState(() {
                              FocusScope.of(context)
                                  .requestFocus(pinFocusNodes[index]);
                            });
                          },
                          controller: pinControllers[index],
                          maxLength: 1,
                          obscureText: true,
                          obscuringCharacter: getTheme(context) ? '⚪' : "⚫",
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            counterText: "",
                            hintText: '',
                            hintStyle: const TextStyle(fontSize: 20.0),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 26.0),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  const BorderSide(color: AppColors.primary),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  const BorderSide(color: AppColors.c_400),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  const BorderSide(color: AppColors.c_400),
                            ),
                            filled: true,
                            fillColor: pinFocusNodes[index].hasFocus
                                ? AppColors.yellowTransparent
                                : getTheme(context)
                                    ? const Color(0xFF1F222A)
                                    : AppColors.c_200,
                          ),
                          textAlign: TextAlign.center,
                          focusNode: pinFocusNodes[index],
                          onChanged: (value) {
                            setState(() {
                              handleCodeInput(index, value);
                            });
                          },
                        ),
                      );
                    }),
                  ),
                  60.ph,
                ],
              ),
            ),
            GlobalButton(
              color: AppColors.primary,
              title: 'Continue',
              radius: 100,
              textColor: AppColors.black,
              onTap: () {
                String pinCode = "";
                for (var element in pinControllers) {
                  pinCode += element.text;
                }
                if (currentPin.isEmpty) {
                  currentPin = pinCode;
                  for (var element in pinControllers) {
                    element.clear();
                  }
                } else {
                  if (currentPin == pinCode) {
                    StorageRepository.putString("code", pinCode);
                    Navigator.pushNamed(context, RouteNames.fingerprintScreen);
                  }else{
                    showErrorMessage(message: "Pin Code Mos Emas", context: context);
                    for (var element in pinControllers) {
                      element.clear();
                    }
                    currentPin="";

                  }
                }

                // print(pinCode);
                // print(StorageRepository.getString("code"));
                // if (pinCode == StorageRepository.getString("code")) {
                //   Navigator.pushReplacementNamed(context, RouteNames.tabBox);
                // }
              },
            ),
          ],
        ),
      ),
    );
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
  void dispose() {
    disposeControllersAndFocusNodes();
    super.dispose();
  }

  void disposeControllersAndFocusNodes() {
    for (var controller in pinControllers) {
      controller.dispose();
    }
    for (var focusNode in pinFocusNodes) {
      focusNode.dispose();
    }
  }

  void handleCodeInput(int index, String value) {
    if (value.isEmpty) {
      pinControllers[index].clear();
      if (index > 0) {
        FocusScope.of(_context!).requestFocus(pinFocusNodes[index - 1]);
      }
    } else {
      if (index == 3) {
        pinFocusNodes[index].unfocus();
      } else {
        FocusScope.of(_context!).requestFocus(pinFocusNodes[(index + 1) % 4]);
      }
    }
  }

  BuildContext? _context;

  void setContext(BuildContext context) {
    _context = context;
  }
}
