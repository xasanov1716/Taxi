import 'package:flutter/material.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';

class AuthNavigatorButton extends StatelessWidget {
  const AuthNavigatorButton({
    super.key,
    required this.desc,
    required this.action,
    required this.onTap,
  });

  final String desc;
  final String action;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(desc,style: Theme.of(context).textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w400, letterSpacing: 0.2, color: AppColors.c_500
        ),),
        TextButton(onPressed: onTap, child: Text(action,style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: AppColors.primary
        ),))
      ],
    );
  }
}
