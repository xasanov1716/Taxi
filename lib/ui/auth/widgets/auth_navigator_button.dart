import 'package:flutter/material.dart';

import '../../../utils/colors/app_colors.dart';

class AuthNavigatorButton extends StatelessWidget {
  const AuthNavigatorButton(
      {Key? key,
      required this.title,
      required this.onTap,
      required this.onTapTitle})
      : super(key: key);

  final String title;
  final String onTapTitle;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: AppColors.c_500, fontWeight: FontWeight.w400),
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            onTapTitle,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: AppColors.primary, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
