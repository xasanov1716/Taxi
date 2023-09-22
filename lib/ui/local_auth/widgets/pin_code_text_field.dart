import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class PinCodePinPutField extends StatefulWidget {
  const PinCodePinPutField({super.key});

  @override
  _PinCodePinPutFieldState createState() => _PinCodePinPutFieldState();
}

class _PinCodePinPutFieldState extends State<PinCodePinPutField> {
  // final TextEditingController codeController = TextEditingController();
  final List<FocusNode> pinFocusNodes = List.generate(4, (_) => FocusNode());
  final List<TextEditingController> pinControllers =
      List.generate(4, (_) => TextEditingController());

  // String currentPin = '';

  @override
  void initState() {
    super.initState();

    setContext(context);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(4, (index) {
        return SizedBox(
          height: 85.w,
          width: 85.0.w,
          child: TextField(
            style: Theme.of(context)
                .appBarTheme
                .titleTextStyle!
                .copyWith(fontSize: 20.sp),
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
              contentPadding:
                  EdgeInsets.symmetric(vertical: 16.0, horizontal: 26.0),
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
