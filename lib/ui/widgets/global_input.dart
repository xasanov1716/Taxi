import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class GlobalTextField extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Widget? prefixIcon;
  final String caption;
  final ValueChanged? onChanged;
  final FocusNode? focusNode;
  final bool readOnly;
  final MaskTextInputFormatter? maskFormatter;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool? obscureText;
  final EdgeInsets? contentPadding;

  const GlobalTextField({
    Key? key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.prefixIcon,
    this.caption = "",
    this.suffixIcon,
    this.readOnly = false,
    this.controller,
    this.onChanged,
    this.focusNode,
    this.maskFormatter,
    this.obscureText,
    this.contentPadding,
  }) : super(key: key);

  @override
  State<GlobalTextField> createState() => _GlobalTextFieldState();
}

class _GlobalTextFieldState extends State<GlobalTextField> {
  late TextEditingController _internalController;
  final internalFocusNode = FocusNode();
  Color color = const Color(0xFFFAFAFA);

  @override
  void initState() {
    super.initState();
    _internalController = widget.controller ?? TextEditingController();
    widget.focusNode?.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    widget.focusNode?.removeListener(_onFocusChange);
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      obscuringCharacter: '●',
      readOnly: widget.readOnly,
      controller: _internalController,
      focusNode: widget.focusNode ?? internalFocusNode,
      inputFormatters:widget.maskFormatter !=null ? [widget.maskFormatter!] : [],
      obscureText: widget.obscureText ?? false,
      decoration: InputDecoration(
        hintStyle: TextStyle(
          fontFamily: "Urbanist",
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xff9e9e9e),
          height: 20 / 14,
        ),
        contentPadding:widget.contentPadding,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color:
                  getTheme(context) ? AppColors.dark3 : const Color(0xFFFAFAFA),
              width: 1),
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
          borderSide: BorderSide(color: getTheme(context)? const Color(0xFFFAFAFA):AppColors.dark2, width: 1),
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
      // style: TextStyle(color: AppColors.dark3, fontSize: 16.sp),
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
    );
  }
}
