import 'package:flutter/material.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class RememberCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final String? label;

  const RememberCheckBox({super.key, required this.value, required this.onChanged, this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            onChanged(!value);
          },
          child: Container(
            width: 24.0,
            height: 24.0,
            decoration: BoxDecoration(
              color: value ? AppColors.primary : null,
              border: Border.all(
                width: 3.0,
                color: AppColors.primary,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: value
                ? const Icon(
                    Icons.check,
                    size: 16.0,
                    color: AppColors.white,
                  )
                : null,
          ),
        ),
        if (label != null) ...[
          12.pw,
          Text(
            label!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          )
        ]
      ],
    );
  }
}
