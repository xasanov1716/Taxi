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

class SetPinScreen extends StatefulWidget {
  const SetPinScreen({super.key});

  @override
  State<SetPinScreen> createState() => _SetPinScreenState();
}

class _SetPinScreenState extends State<SetPinScreen> {
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
                  Navigator.pushNamed(context, RouteNames.tabBox);
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
