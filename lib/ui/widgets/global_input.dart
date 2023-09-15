import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';

class GlobalTextField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String prefixIcon;
  final String caption;
  final ValueChanged? onChanged;
  final FocusNode? focusNode;
  final MaskTextInputFormatter? maskFormatter;
  final TextEditingController controller;
  final String suffixIcon;

  GlobalTextField({
    Key? key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.prefixIcon = "",
    this.caption = "",
    this.suffixIcon = "",
    required this.controller,
    this.onChanged,
    this.focusNode,
    this.maskFormatter,
  }) : super(key: key);

  final FocusNode _textFieldFocus = FocusNode();


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,

      focusNode: _textFieldFocus,
      decoration: InputDecoration(
        hintStyle: const TextStyle(
          fontFamily: "Urbanist",
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xff9e9e9e),
          height: 20 / 14,
        ),
        hintText: hintText,
        prefixIcon: prefixIcon.isEmpty
            ? null
            : Padding(
                padding: EdgeInsets.only(left: 20.w, right: 12.w),
                child: SvgPicture.asset(prefixIcon),
              ),
        suffixIcon: suffixIcon.isEmpty
            ? null
            : Padding(
                padding: EdgeInsets.only(left: 12.w, right: 20.w),
                child: SvgPicture.asset(suffixIcon),
              ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFFAFAFA), width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primary, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFFAFAFA), width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: _textFieldFocus.hasFocus
            ? AppColors.yellowBackground
            : const Color(0xFFFAFAFA),
        filled: true,
      ),
      keyboardType: keyboardType,
      textInputAction: textInputAction,
    );
  }
}
