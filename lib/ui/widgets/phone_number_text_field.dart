import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';

import 'package:taxi_app/utils/theme/get_theme.dart';

class PhoneNumberInput extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String caption;
  final TextEditingController? controller;
  final String? rightImage;
  final ValueChanged? onChanged;
  final FocusNode focusNode;
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
    required this.focusNode,
    this.onChanged,
  }) : super(key: key);

  @override
  PhoneNumberInputWidget createState() => PhoneNumberInputWidget();
}

class PhoneNumberInputWidget extends State<PhoneNumberInput> {
  bool isFocus = false;
  bool hasValue = false;
  bool isFocused = false;
  Color backgroundColor = AppColors.white;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.text.isNotEmpty) {
        if (widget.focusNode.hasFocus) {
          setState(() {});
        } else {
          if (AdaptiveTheme.of(context).theme == AdaptiveTheme.of(context).darkTheme) {
            setState(() {});
          } else {
            setState(() {});
          }
        }
      } else {
        if (widget.focusNode.hasFocus) {
          setState(() {});
        } else {
          setState(() {});
        }
      }
    });
    widget.focusNode.addListener(() {
      if (widget.focusNode.hasFocus) {
        setState(() {
          backgroundColor = AppColors.orangeTransparent;
        });
      } else {
        if (_controller.text.isNotEmpty) {
          setState(() {
            backgroundColor = AppColors.white;
          });
        } else {
          setState(() {
            backgroundColor = AppColors.white;
          });
        }
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
          focusNode: widget.focusNode,
          inputFormatters: widget.maskFormatter != null ? [widget.maskFormatter!] : null,
          decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(20),
              child: Text('+998', style: Theme.of(context).textTheme.headlineSmall),
            ),
            suffixIcon: widget.rightImage != null
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
            fillColor: widget.focusNode.hasFocus ? AppColors.orangeTransparent : null,
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
