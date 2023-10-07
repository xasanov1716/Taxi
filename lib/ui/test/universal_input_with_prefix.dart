import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/fonts/text_styles.dart';

class CustomNormalTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final FormFieldValidator<String?>? validator;
  final ValueChanged? onChanged;
  final String prefix;
  final TextInputType? inputType;

  const CustomNormalTextField({
    super.key,
    this.controller,
    required this.hintText,
    this.validator,
    this.onChanged,
    required this.prefix,
    this.inputType,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomNormalTextFieldState createState() => _CustomNormalTextFieldState();
}

class _CustomNormalTextFieldState extends State<CustomNormalTextField> {
  bool isFocus = false;
  bool hasInput = false;
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_onInputChanged);
    _focusNode.addListener(_onFocusChanged);
  }

  void _onInputChanged() {
    setState(() {
      hasInput = _controller.text.isNotEmpty;
    });
  }

  void _onFocusChanged() {
    setState(() {
      isFocus = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      onChanged: widget.onChanged,
      keyboardType: widget.inputType,
      focusNode: _focusNode,
      style: AppTextStyle.bodyMediumSemibold,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        hintText: widget.hintText,
        fillColor: isFocus ? AppColors.orangeTransparent : null,
        prefixIcon: SvgPicture.asset(
          widget.prefix,
          fit: BoxFit.scaleDown,
          colorFilter: ColorFilter.mode(
              isFocus
                  ? AppColors.primary
                  : hasInput
                      ? (AdaptiveTheme.of(context).theme == AdaptiveTheme.of(context).darkTheme
                          ? AppColors.white
                          : AppColors.c_900)
                      : AppColors.c_500,
              BlendMode.srcIn),
        ),
      ),
      validator: widget.validator,
    );
  }
}
