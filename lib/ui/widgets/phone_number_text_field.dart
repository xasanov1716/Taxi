import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';

class PhoneNumberInput extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String caption;
  final TextEditingController? controller;
  final String? rightImage;
  final ValueChanged? onChanged;
  final FocusNode? focusNode;
  final String? leftImage;
  final MaskTextInputFormatter? maskFormatter;
  const PhoneNumberInput({
    Key? key,
    required this.hintText,
    required this.keyboardType,
    required this.textInputAction,
    this.caption = '',
    this.controller,
    this.rightImage,
    this.maskFormatter,
    this.leftImage,
    this.focusNode,
    this.onChanged,
  }) : super(key: key);

  @override
  _PhoneNumberInput createState() => _PhoneNumberInput();
}

class _PhoneNumberInput extends State<PhoneNumberInput> {
  final bool _isPasswordVisible = false;

  bool isFocus = false;
  final FocusNode _textFieldFocus = FocusNode();
  Color _color = AppColors.c_50;
  Color _iconColor = AppColors.c_300;

  @override
  void initState() {
    _textFieldFocus.addListener(() {
      if (_textFieldFocus.hasFocus) {
        setState(() {
          _color = AppColors.primary;
          _iconColor = Colors.amber;
        });
      } else {
        setState(() {
          _color = Colors.white;
          _iconColor = Colors.grey;
        });
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
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          controller: widget.controller ?? widget.controller,
          onChanged: widget.onChanged,
          focusNode: widget.focusNode ?? _textFieldFocus,
          inputFormatters: widget.maskFormatter != null ? [widget.maskFormatter!] : null,
          decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: const Padding(
              padding:  EdgeInsets.all(20),
              child: Text('+998',style: TextStyle(fontFamily: 'Urbanist',color: AppColors.c_800,fontSize: 16),),
            ),
            suffixIcon: widget.rightImage != null ? Padding(
              padding: const EdgeInsets.all(20),
              child: SvgPicture.asset(widget.rightImage!,colorFilter: const ColorFilter.mode(AppColors.c_400, BlendMode.srcIn),)
            ) : null,
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
            fillColor: _color,
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
