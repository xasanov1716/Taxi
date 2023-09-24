import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/constants/storage_keys.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';
import 'package:taxi_app/utils/ui_utils/error_message_dialog.dart';

class PinPutField extends StatefulWidget {
  const PinPutField({super.key, this.isFromSecurity});
  final bool? isFromSecurity;

  @override
  // ignore: library_private_types_in_public_api
  _PinPutFieldState createState() => _PinPutFieldState();
}

class _PinPutFieldState extends State<PinPutField> {
  List result = [];
  final List<FocusNode> pinFocusNodes = List.generate(4, (_) => FocusNode());
  final List<TextEditingController> pinControllers =
      List.generate(4, (_) => TextEditingController());

  @override
  void initState() {
    super.initState();

    setContext(context);
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
    return Column(
      children: [
        60.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (index) {
            return SizedBox(
              height: 85.w,
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
                  onTap: () {
                    setState(() {
                      FocusScope.of(context).requestFocus(pinFocusNodes[index]);
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
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 26.0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.primary),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.c_400),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.c_400),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.error),
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
              ),
            );
          }),
        ),
        60.ph,
        const Expanded(child: SizedBox()),
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
            debugPrint(pinCode);
            debugPrint(StorageRepository.getString(StorageKeys.pinCode));
            if (pinCode == StorageRepository.getString(StorageKeys.pinCode)) {
              if (widget.isFromSecurity != false &&
                  widget.isFromSecurity != null) {
                Navigator.pushReplacementNamed(
                    context, RouteNames.setPinCodeScreen);
              } else {
                Navigator.pushReplacementNamed(context, RouteNames.tabBox);
              }
            } else {
              showErrorMessage(message: "Pin Code Xato!", context: context);
            }
          },
        ),
      ],
    );
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
        setState(() {
          FocusScope.of(_context!).requestFocus(pinFocusNodes[index - 1]);
        });
      }
    } else {
      if (index == 3) {
        pinFocusNodes[index].unfocus();
      } else {
        setState(() {
          FocusScope.of(_context!).requestFocus(pinFocusNodes[(index + 1) % 4]);
        });
      }
      pinControllers[index].text = value;
    }
  }

  BuildContext? _context;

  void setContext(BuildContext context) {
    _context = context;
  }
}
