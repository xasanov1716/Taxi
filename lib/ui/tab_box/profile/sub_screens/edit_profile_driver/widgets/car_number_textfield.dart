import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class CarNumberTextField extends StatelessWidget {
  final String hintText;
  final int maxLength;
  final List<TextInputFormatter> inputFormatter;
  final double width;
  final FocusNode focusNode;
  final TextEditingController controller;
  final FocusNode? nextFocusNode;
  final FocusNode? previousFocusNode;
  final ValueChanged? valueChanged;
  final TextInputType textInputType;

  CarNumberTextField({
    required this.hintText,
    required this.maxLength,
    required this.inputFormatter,
    required this.width,
    required this.focusNode,
    required this.controller,
    this.nextFocusNode,
    this.previousFocusNode,
    this.valueChanged, required this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      width: width,
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        textCapitalization: TextCapitalization.characters,
        maxLines: 1,
        textAlign: TextAlign.center,
        maxLength: maxLength,
        keyboardType: textInputType,
        inputFormatters: inputFormatter,
        decoration: InputDecoration(
          fillColor: getTheme(context) ? AppColors.dark1 : AppColors.white,
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.c_500,
            fontSize: 45.sp,
            fontFamily: 'Chakra',
            fontWeight: FontWeight.w700,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          counterText: '',
        ),
        style: TextStyle(
          color: getTheme(context)? AppColors.c_300:AppColors.dark2,

        fontSize: 48.sp,
          fontFamily: 'Chakra',
          fontWeight: FontWeight.w700,
        ),
        onChanged: (value) {
          if (value.length == maxLength && nextFocusNode != null) {
            FocusScope.of(context).requestFocus(nextFocusNode);
          } else if (value.isEmpty && previousFocusNode != null) {
            FocusScope.of(context).requestFocus(previousFocusNode);
          }
          valueChanged!(value);
        },
      ),
    );
  }
}

class UppercaseTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(), // Convert to uppercase
      selection: newValue.selection,
    );
  }
}
