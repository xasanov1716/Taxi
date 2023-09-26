import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/ui/widgets/global_input.dart';


class TextFieldItem extends StatelessWidget {
  const TextFieldItem({super.key, required this.hintText, required this.startIcon, required this.endIcon});

  final String hintText;
  final Widget startIcon;
  final Widget endIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        startIcon,
        SizedBox(
          width: 345.w,
          height: 73.h,
          child: GlobalTextField(
            hintText: hintText,
            suffixIcon: Padding(padding: EdgeInsets.all(18.w), child: endIcon),
          ),
        ),
      ],
    );
  }
}
