import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/constants/storage_keys.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class PinCodeSetScreen extends StatefulWidget {
  const PinCodeSetScreen({super.key});

  @override
  State<PinCodeSetScreen> createState() => _PinCodeSetScreenState();
}

class _PinCodeSetScreenState extends State<PinCodeSetScreen> {
  List result = [];
  String code = '';
  String currentPin = '';
  final List<FocusNode> pinFocusNodes = List.generate(4, (_) => FocusNode());
  final List<TextEditingController> pinControllers =
      List.generate(4, (_) => TextEditingController());

  @override
  void initState() {
    pinFocusNodes[0].requestFocus();

    super.initState();
  }

  handleKey(RawKeyEvent key, int index) {
    if (key is RawKeyUpEvent) {
      if (key.data.logicalKey.keyLabel == 'Backspace') {
        for (var i = 0; i < pinControllers.length; i++) {
          pinControllers[i].clear();
          pinFocusNodes[i].unfocus();
        }
        setState(() {
          pinFocusNodes[0].requestFocus();
        });
        result.clear();
      } else {
        handleCodeInput(index, key.data.logicalKey.keyLabel);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const GlobalAppBar(title: "Create New PIN"),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 48.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Yangi Parollni Kiriting',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontSize: 20.sp),
            ),
            Expanded(
              child: ListView(
                children: [
                  60.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(4, (index) {
                      return SizedBox(
                        width: 85.0.w,
                        child: RawKeyboardListener(
                          focusNode: FocusNode(),
                          onKey: (key) {
                            handleKey(key, index);
                          },
                          child: TextField(
                            style: Theme.of(context)
                                .appBarTheme
                                .titleTextStyle!
                                .copyWith(fontSize: 16.sp),
                            controller: pinControllers[index],
                            maxLength: 1,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              counterText: "",
                              hintText: '',
                              hintStyle: const TextStyle(fontSize: 20.0),
                              contentPadding: const EdgeInsets.symmetric(
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
                          ),
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
                pinCode = resultStr(result);

                if (pinCode.isNotEmpty && pinCode.length == 4) {
                  StorageRepository.putString(StorageKeys.pinCode, pinCode);
                  pinCode = '';
                  Navigator.pushNamed(context, RouteNames.chekSetPinCodeScreen);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    disposeControllersAndFocusNodes();
    super.dispose();
  }

  String resultStr(List result) {
    String javob = '';
    for (int i = 0; result.length > i; i++) {
      javob += result[i];
    }
    return javob;
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
    if (index == 3) {
      pinControllers[index].text = value;
      result.add(value);
      Future.delayed(const Duration(milliseconds: 300), () {
        pinControllers[index].text = getTheme(context) ? '⚪' : "⚫";
      });
      pinFocusNodes[index].unfocus();
    } else {
      pinControllers[index].text = value;
      result.add(value);
      Future.delayed(const Duration(milliseconds: 400), () {
        pinControllers[index].text = getTheme(context) ? '⚪' : "⚫";
      });
      setState(() {
        pinFocusNodes[(index + 1) % 4].requestFocus();
      });
    }
  }
}
