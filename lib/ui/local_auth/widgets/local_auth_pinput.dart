import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';

class LocalAuthPinput extends StatelessWidget {
  const LocalAuthPinput({
    Key? key,
    required this.pinPutController,
    required this.onCompleted,
  }) : super(key: key);

  final TextEditingController pinPutController;
  final ValueChanged<String> onCompleted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: Pinput(
        showCursor: false,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          FilteringTextInputFormatter.digitsOnly
        ],
        defaultPinTheme: PinTheme(
          width: 70.w,
          height: 50.w,
          textStyle: const TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
          decoration: BoxDecoration(
            color: AppColors.c_50,
            border: Border.all(
              color: AppColors.c_200,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        onCompleted: onCompleted,
        controller: pinPutController,
        preFilledWidget: Container(
          decoration: BoxDecoration(
            color: AppColors.primaryTransparent,
            border: Border.all(
              color: AppColors.primary,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        followingPinTheme: PinTheme(
          width: 70.w,
          height: 50.w,
          decoration: BoxDecoration(
            color: AppColors.c_50,
            border: Border.all(
              color: AppColors.c_200,
              width: 0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    );
  }
}
