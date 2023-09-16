import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Checkbox(
      value: value,
      onChanged: (v) {
        setState(() {
          value = v!;
        });
      },
      activeColor: AppColors.primary,
      side: const BorderSide(color: AppColors.primary),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
    );
  }
}
