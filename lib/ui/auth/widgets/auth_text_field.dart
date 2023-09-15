import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.isPassword = false,
  });

  final String hintText;
  final String prefixIcon;
  final bool isPassword;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isObscured = false;
  bool hasValue = false;
  bool isFocused = false;
  Color _backgroundColor = AppColors.white;
  Color _iconColor = AppColors.c_500;
  var maskFormatter = MaskTextInputFormatter(
      mask: '## ### ## ##', filter: {"#": RegExp(r'[0-9]')});

  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.text.isNotEmpty) {
        if (_focusNode.hasFocus) {
          setState(() {
            _iconColor = AppColors.primary;
          });
        } else {
          setState(() {
            _iconColor = AppColors.c_900;
          });
        }
      } else {
        if (_focusNode.hasFocus) {
          setState(() {
            _iconColor = AppColors.primary;
          });
        } else {
          setState(() {
            _iconColor = AppColors.c_500;
          });
        }
      }
    });
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          _backgroundColor = AppColors.orangeTransparent;
          _iconColor = AppColors.primary;
        });
      } else {
        if (_controller.text.isNotEmpty) {
          setState(() {
            _backgroundColor = AppColors.white;
            _iconColor = AppColors.c_900;
          });
        } else {
          setState(() {
            _backgroundColor = AppColors.white;
            _iconColor = AppColors.c_500;
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: widget.isPassword?TextInputType.text:TextInputType.phone,
      textInputAction: widget.isPassword?TextInputAction.done:TextInputAction.go,
      focusNode: _focusNode,
      controller: _controller,
      obscureText: _isObscured,
      inputFormatters: [if(!widget.isPassword)maskFormatter],
      style: Theme.of(context)
          .textTheme
          .labelLarge
          ?.copyWith(fontWeight: FontWeight.w600, letterSpacing: 0.2),
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          hintText: widget.hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(fontWeight: FontWeight.w400, color: AppColors.c_500),
          prefixIcon: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                widget.prefixIcon,
                colorFilter: ColorFilter.mode(_iconColor, BlendMode.srcIn),
                semanticsLabel: "A grey color mode",
              )),
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                  icon: SvgPicture.asset(
                    _isObscured?AppIcons.hide:AppIcons.show,
                    colorFilter: ColorFilter.mode(_iconColor, BlendMode.srcIn),
                  ))
              : const SizedBox(),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(color: AppColors.c_50)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(color: AppColors.c_50)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(width: 1.w, color: AppColors.primary)),
          fillColor: _backgroundColor,
          filled: true),
    );
  }
}
