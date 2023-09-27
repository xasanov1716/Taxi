import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/fonts/text_styles.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

class CustomPasswordTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final FormFieldValidator<String?>? validator;
  final ValueChanged? onChanged;

  const CustomPasswordTextField({
    super.key,
    this.controller,
    required this.hintText,
    this.validator,
    this.onChanged,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomPasswordTextFieldState createState() => _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool _obscureText = true;
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
      focusNode: _focusNode,
      obscureText: _obscureText,
      style: AppTextStyle.bodyMediumSemibold,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        hintText: widget.hintText,
        fillColor: isFocus ? AppColors.orangeTransparent : null,
        prefixIcon: SvgPicture.asset(
          AppIcons.lock,
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
        suffixIcon: IconButton(
          onPressed: () => setState(() => _obscureText = !_obscureText),
          icon: SvgPicture.asset(
            _obscureText ? AppIcons.hide : AppIcons.show,
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
      ),
      validator: widget.validator,
    );
  }
}
