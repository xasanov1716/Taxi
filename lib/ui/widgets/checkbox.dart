import 'package:flutter/material.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';

class CustomCheckbox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  const CustomCheckbox({super.key, required this.isChecked, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!isChecked);
      },
      child: Container(
        width: 24.0,
        height: 24.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primary, // Border color
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8),
          color: isChecked ? AppColors.primary : AppColors.white, // Fill color
        ),
        child: isChecked
            ? const Icon(
          Icons.check,
          size: 16.0,
          color: Colors.white, // Checkmark color
        )
            : null,
      ),
    );
  }
}