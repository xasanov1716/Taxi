import 'package:flutter/material.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

void showSnackBar({required BuildContext context, required String text}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: getTheme(context) ? AppColors.black : AppColors.white,
      content: Text(text,style: Theme.of(context).textTheme.bodyMedium,),
    ),
  );
}
