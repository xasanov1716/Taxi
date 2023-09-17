import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/ui/auth/widgets/remember_me.dart';
import 'package:taxi_app/ui/widgets/checkbox.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';

class ForgetPasswordCheckbox extends StatefulWidget {
  const ForgetPasswordCheckbox({super.key});

  @override
  State<ForgetPasswordCheckbox> createState() => _ForgetPasswordCheckboxState();
}

class _ForgetPasswordCheckboxState extends State<ForgetPasswordCheckbox> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return RememberCheckBox(
      value: value,
      onChanged: (v) {
        setState(() {
          value = v;
        });
      },
    );
  }
}
