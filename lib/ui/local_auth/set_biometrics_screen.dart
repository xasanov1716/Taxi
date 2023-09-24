import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_auth/local_auth.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/ui_utils/error_message_dialog.dart';

class SetBiometricsScreen extends StatefulWidget {
  const SetBiometricsScreen({super.key});

  @override
  State<SetBiometricsScreen> createState() => _SetBiometricsScreenState();
}

class _SetBiometricsScreenState extends State<SetBiometricsScreen> {
  bool isAuth = false;
  final LocalAuthentication auth = LocalAuthentication();



  void _checkBiometric() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: 'Tasdiqlash uchun sensorga barmog\'ingizni bosing',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: false,
          biometricOnly: true,
        ),
      );
      debugPrint("AUTHENTICATED START:$authenticated");
    } catch (e) {
      debugPrint("error using biometric auth: $e");
      if (context.mounted) {
        showErrorMessage(
            message: "Barmoq izini skanerlash xato!", context: context);
      }
    }
    setState(() {
      isAuth = authenticated ? true : false;
      StorageRepository.putBool("isAuth", isAuth);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
          onTap: () {
            Navigator.pop(context);
          },
          title: "Barmoq izingizni oʻrnating"),
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
                    'Hisobingizni yaratish uchun barmoq \n                    izini qo\'shing.',
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            Image.asset(
              AppIcons.fingerPrint,
              width: 228 * width / figmaWidth,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Boshlash uchun barmoq izi skaneriga \n                barmog‘ingizni qo‘ying.',
                  style: TextStyle(fontSize: 18.sp),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: GlobalButton(
                  title: "O'tkazib yubor",
                  onTap: () {
                    Navigator.pushReplacementNamed(context, RouteNames.tabBox);
                  },
                  radius: 100,
                  color: AppColors.yellowBackground,
                  textColor: AppColors.dark3,
                )),
                SizedBox(width: 12.w),
                Expanded(
                  child: GlobalButton(
                    title: "Keyingi",
                    onTap: () {
                      _checkBiometric();
                      if (StorageRepository.getBool("isAuth")) {
                        Navigator.pushReplacementNamed(
                            context, RouteNames.tabBox);
                      }
                    },
                    radius: 100,
                    color: AppColors.primary,
                    textColor: AppColors.dark3,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
