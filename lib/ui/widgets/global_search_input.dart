import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class GlobalSearchTextField extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String caption;
  final TextEditingController? controller;
  final String? rightImage;
  final ValueChanged? onChanged;
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  final String? leftImage;
  final bool? readOnly;
  final MaskTextInputFormatter? maskFormatter;
  const GlobalSearchTextField({
    Key? key,
    required this.hintText,
    required this.keyboardType,
    required this.textInputAction,
    this.caption = '',
    this.controller,
    this.rightImage,
    this.maskFormatter,
    this.leftImage,
    this.onTap,
    this.readOnly,
    this.focusNode,
    this.onChanged,
  }) : super(key: key);

  @override
  GlobalSearchTextFieldWidget createState() => GlobalSearchTextFieldWidget();
}

class GlobalSearchTextFieldWidget extends State<GlobalSearchTextField> {
  bool isFocus = false;
  final internalFocusNode = FocusNode();
  final FocusNode _textFieldFocus = FocusNode();

  @override
  void initState() {
    _textFieldFocus.addListener(() {
      if (_textFieldFocus.hasFocus) {
        setState(() {});
      } else {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.caption.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              widget.caption,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black,
              ),
            ),
          ),
        SizedBox(height: 5.h),
        TextField(
          controller: widget.controller ?? widget.controller,
          onChanged: widget.onChanged,
          readOnly: widget.readOnly ?? false,
          focusNode: widget.focusNode ?? _textFieldFocus,
          inputFormatters: widget.maskFormatter != null ? [widget.maskFormatter!] : null,
          decoration: InputDecoration(
            hintText: widget.hintText,
            suffixIcon: widget.rightImage != null
                ? GestureDetector(
                    onTap: widget.onTap,
                    child: Padding(
                      padding: EdgeInsets.all(20.w),
                      child: SvgPicture.asset(
                        widget.rightImage!,
                        colorFilter: const ColorFilter.mode(AppColors.c_500, BlendMode.srcIn),
                      ),
                    ))
                : null,
            prefixIcon: widget.leftImage != null
                ? Padding(
                    padding: const EdgeInsets.all(20),
                    child: SvgPicture.asset(
                      widget.rightImage!,
                      colorFilter: const ColorFilter.mode(AppColors.c_400, BlendMode.srcIn),
                    ))
                : null,
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: getTheme(context) ? AppColors.dark3 : const Color(0xFFFAFAFA)),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primary),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: getTheme(context) ? const Color(0xFFFAFAFA) : AppColors.dark2),
              borderRadius: BorderRadius.circular(10),
            ),
            fillColor: getTheme(context)
                ? (widget.focusNode?.hasFocus ?? internalFocusNode.hasFocus)
                    ? AppColors.yellowTransparent
                    : AppColors.dark2
                : (widget.focusNode?.hasFocus ?? internalFocusNode.hasFocus)
                    ? const Color(0xFFFFFAED)
                    : const Color(0xFFFAFAFA),
            filled: true,
          ),
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          obscureText: widget.keyboardType == TextInputType.visiblePassword,
        ),
      ],
    );
  }
}
