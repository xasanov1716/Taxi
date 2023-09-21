import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalBottomSheetBottom extends StatelessWidget {
  const GlobalBottomSheetBottom(
      {super.key,
      required this.text,
      required this.colorText,
      required this.colorContainer});

  final String text;
  final Color colorText;
  final Color colorContainer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Ink(
          width: 184.w,
          height: 58.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r), color: colorContainer),
          child: InkWell(
            borderRadius: BorderRadius.circular(100.r),
            onTap: () {},
            child: Center(
              child: Text(
                text,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontFamily: "Urbanist",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: colorText),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
