import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';

class GlobalTextField extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String prefixIcon;
  final String caption;
  final ValueChanged? onChanged;
  final FocusNode? focusNode;
  final MaskTextInputFormatter? maskFormatter;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool? obscureText;

  const GlobalTextField({
    Key? key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.prefixIcon = "",
    this.caption = "",
    this.suffixIcon,
    this.controller,
    this.onChanged,
    this.focusNode,
    this.maskFormatter,
    this.obscureText,
  }) : super(key: key);

  @override
  State<GlobalTextField> createState() => _GlobalTextFieldState();
}

class _GlobalTextFieldState extends State<GlobalTextField> {
  late TextEditingController _internalController;
  final FocusNode _textFieldFocus = FocusNode();
  Color color = const Color(0xFFFAFAFA);


  @override
  void initState() {
    super.initState();
    _internalController = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _internalController,
      focusNode: _textFieldFocus,
      obscureText: !widget.obscureText!,
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
                child: SvgPicture.asset(
                  widget.prefixIcon,
                  colorFilter: ColorFilter.mode(
                      AdaptiveTheme.of(context).theme ==
                              AdaptiveTheme.of(context).darkTheme
                          ? AppColors.white
                          : AppColors.c_900,
                      BlendMode.srcIn),
                ),
              ),
        suffixIcon: widget.suffixIcon,
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
        fillColor: AdaptiveTheme.of(context).theme ==
                AdaptiveTheme.of(context).darkTheme
            ? _textFieldFocus.hasFocus
                ? AppColors.yellowTransparent
                : AppColors.dark2
            : _textFieldFocus.hasFocus
                ? const Color(0xFFFFFAED)
                : const Color(0xFFFAFAFA),
        filled: true,
      ),
      // style: TextStyle(color: AppColors.dark3, fontSize: 16.sp),
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
    );
  }
}
