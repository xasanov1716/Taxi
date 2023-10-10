import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';

class AmountTextField extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final ValueChanged? onChanged;
  final MaskTextInputFormatter? maskFormatter;
  final TextEditingController? controller;

  const AmountTextField({
    Key? key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.controller,
    this.onChanged,
    this.maskFormatter,
  }) : super(key: key);

  @override
  State<AmountTextField> createState() => _GlobalTextFieldState();
}

class _GlobalTextFieldState extends State<AmountTextField> {
  late TextEditingController _internalController;
  @override
  void initState() {
    super.initState();
    _internalController = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Theme.of(context).textTheme.displayLarge,
      textAlign: TextAlign.center,
      onChanged: widget.onChanged,
      controller: _internalController,
      inputFormatters: [widget.maskFormatter!],
      decoration: InputDecoration(
        hintStyle: TextStyle(
          fontFamily: "Urbanist",
          fontSize: 48.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xff9e9e9e),
          height: 20 / 14,
        ),
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(24.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(24.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(24.r),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(24.r),
        ),
        fillColor: Colors.transparent,
        filled: true,
      ),
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
    );
  }
}
