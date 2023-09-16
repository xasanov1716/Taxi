import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/ui/account/fingertest_screen.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

class FingerprintScreen extends StatefulWidget {
  const FingerprintScreen({super.key});

  @override
  State<FingerprintScreen> createState() => _FingerprintScreenState();
}

class _FingerprintScreenState extends State<FingerprintScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        title: const Text(
          "Set Your Fingerprint",
          style: TextStyle(
            fontFamily: "Urbanist",
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Color(0xff212121),
            height: 29 / 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Add a fingerprint to make your account\n                    more secure.',
                  style: TextStyle(fontSize: 18.sp),
                ),
              ],
            ),
            Image.asset(AppIcons.fingerPrint),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Please put your finger on the fingerprint\n                    scanner to get started.',
                  style: TextStyle(fontSize: 18.sp),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: GlobalButton(
                  title: "Skip",
                  onTap: () {},
                  radius: 100,
                  color: AppColors.yellowBackground,
                  textColor: AppColors.dark3,
                )),
                SizedBox(width: 12.w),
                Expanded(
                    child: GlobalButton(
                  title: "Continue",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FingerPrintScreenTest()));
                  },
                  radius: 100,
                  color: AppColors.primary,
                  textColor: AppColors.dark3,
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
