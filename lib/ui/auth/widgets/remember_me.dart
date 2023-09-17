import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class RememberCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final String? label;

  const RememberCheckBox(
      {super.key, required this.value, required this.onChanged, this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            onChanged(!value);
          },
          icon: SvgPicture.asset(
            value ? AppIcons.checked : AppIcons.unchecked,
          ),
        ),
        if (label != null) ...[
          12.pw,
          Text(
            label!,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          )
        ]
      ],
    );
  }
}
