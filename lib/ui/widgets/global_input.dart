import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';

class GlobalTextField extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String prefixIcon;
  final String caption;
  final TextEditingController controller;
  final String suffixIcon;

  const GlobalTextField({
    Key? key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.prefixIcon = "",
    this.caption = "",
    this.suffixIcon = "",
    required this.controller,
  }) : super(key: key);

  @override
  State<GlobalTextField> createState() => _GlobalTextFieldState();
}

class _GlobalTextFieldState extends State<GlobalTextField> {
  final FocusNode _textFieldFocus = FocusNode();
  Color color = const Color(0xFFFAFAFA);
  focusColor(){

  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      focusNode: _textFieldFocus,
      decoration: InputDecoration(
        hintStyle: const TextStyle(
          fontFamily: "Urbanist",
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xff9e9e9e),
          height: 20 / 14,
        ),
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon.isEmpty
            ? null
            : Padding(
                padding: EdgeInsets.only(left: 20.w, right: 12.w),
                child: SvgPicture.asset(widget.prefixIcon),
              ),
        suffixIcon: widget.suffixIcon.isEmpty
            ? null
            : Padding(
                padding: EdgeInsets.only(left: 12.w, right: 20.w),
                child: SvgPicture.asset(widget.suffixIcon),
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
            ? const Color(0xFFFFFAED)
            : const Color(0xFFFAFAFA),
        filled: true,
      ),
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
    );
  }
}
