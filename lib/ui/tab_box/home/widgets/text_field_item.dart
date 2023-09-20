import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/global_input.dart';


class TextFieldItem extends StatelessWidget {
  const TextFieldItem({super.key, required this.hintText, required this.startIcon, required this.endIcon});

  final String hintText;
  final Widget startIcon;
  final Widget endIcon;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        startIcon,
        SizedBox(
            width: 340.w,
            child: GlobalTextField(
              hintText: hintText,suffixIcon:Padding(
              padding: const EdgeInsets.all(18.0),
              child: endIcon
            ),
            ),
        ),
      ],
    );
  }
}
