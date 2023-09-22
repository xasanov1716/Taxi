import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';

class AddressDetailController extends StatelessWidget {
  const AddressDetailController(
      {super.key,
      required this.text,
      required this.color,
      required this.iconButton,
      required this.onTap});

  final String text;
  final Color color;
  final VoidCallback onTap;
  final IconButton iconButton;

  @override
  Widget build(BuildContext context) {
    return TextField();

  }
}
