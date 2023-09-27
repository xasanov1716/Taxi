import 'package:flutter/material.dart';
import 'package:taxi_app/utils/fonts/text_styles.dart';

class CustomDefaultTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final FormFieldValidator? validator;
  final void Function(String)? onChanged;

  const CustomDefaultTextField({
    super.key,
    this.controller,
    required this.hintText,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyle.bodyMediumSemibold,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.all(20),
      ),
      validator: validator,
    );
  }
}
