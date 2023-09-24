import 'package:flutter/material.dart';
import 'package:taxi_app/ui/auth/widgets/remember_me.dart';

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
