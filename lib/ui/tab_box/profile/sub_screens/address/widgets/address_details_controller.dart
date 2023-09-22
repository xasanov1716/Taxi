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
    return Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        overflow:TextOverflow.ellipsis,
                        text.length > 30 ? text.substring(0, 30) : text,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: AppColors.c_500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          iconButton,
        ],
      ),
    );
  }
}
