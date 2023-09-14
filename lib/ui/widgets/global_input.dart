import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';

class GlobalTextField extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final IconData? prefixIcon;
  final String caption;
  final IconData? suffixIcon;
  final ValueChanged? onChanged;
  final FocusNode? focusNode;
  final MaskTextInputFormatter? maskFormatter;
  final TextEditingController controller;

  const GlobalTextField({
    Key? key,
    required this.hintText,
    required this.keyboardType,
    required this.textInputAction,
     this.prefixIcon,
     this.maskFormatter,
     this.suffixIcon,
     this.focusNode,
     this.onChanged,
     this.caption = '',
    required this.controller,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _GlobalTextFieldState createState() => _GlobalTextFieldState();
}

class _GlobalTextFieldState extends State<GlobalTextField> {
  bool _isPasswordVisible = false;

  bool isFocus = false;
  Color iconColor = AppColors.c_50;



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              widget.caption!,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
         SizedBox(
          height: 5.h,
        ),
        TextField(
          controller: widget.controller,
          focusNode: widget.focusNode,
          onChanged: widget.onChanged,
          inputFormatters: widget.maskFormatter != null ? [widget.maskFormatter!]: null,
          decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon:  widget.prefixIcon != null? Icon(widget.prefixIcon, color: iconColor) : null,
            suffixIcon: widget.keyboardType == TextInputType.visiblePassword
                ? IconButton(
                    splashRadius: 1,
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: iconColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.c_50, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.c_50, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.c_50, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.c_50, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            fillColor: AppColors.c_50,
            filled: true,
          ),
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          obscureText: widget.keyboardType == TextInputType.visiblePassword
              ? !_isPasswordVisible
              : false,
        ),
      ],
    );
  }
}
