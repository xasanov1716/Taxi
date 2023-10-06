import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, RouteNames.forgotPassword);
        },
        child: Text(
          tr("forgot_password?"),
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(fontWeight: FontWeight.w600, color: AppColors.primary),
        ),
      ),
    );
  }
}
