import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_auth/local_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class FingerprintScreen extends StatefulWidget {
  const FingerprintScreen({super.key});

  @override
  State<FingerprintScreen> createState() => _FingerprintScreenState();
}

class _FingerprintScreenState extends State<FingerprintScreen> {
  bool isAuth = false;

  void _checkBiometric() async {
    final LocalAuthentication auth = LocalAuthentication();
    bool canCheckBiometrics = false;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } catch (e) {
      debugPrint("error biome trics $e");
    }

    debugPrint("biometric is available: $canCheckBiometrics");

    List<BiometricType> availableBiometrics = [];
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } catch (e) {
      debugPrint("error enumerate biometrics $e");
    }

    debugPrint("following biometrics are available");
    if (availableBiometrics.isNotEmpty) {
      for (var ab in availableBiometrics) {
        debugPrint("\ttech: $ab");
      }
    } else {
      debugPrint("no biometrics are available");
    }

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
    } catch (e) {
      debugPrint("error using biometric auth: $e");
    }
    setState(() {
      isAuth = authenticated ? true : false;
      StorageRepository.getInstance();
      StorageRepository.putBool("isAuth", isAuth);
    });

    debugPrint("authenticated: $authenticated");
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
            Image.asset(AppIcons.fingerPrint),
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
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0)),
                            child: SizedBox(
                              height: 487.h,
                              child: Padding(
                                padding: const EdgeInsets.all(32),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 30 * width / 428),
                                      height: 150 * height / 926,
                                      width: 150 * width / 428,
                                      child: Image.asset(
                                          AppIcons.createNewPasswordDialog),
                                    ),
                                    24.ph,
                                    Text("Tabriklaymiz!",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall),
                                    16.ph,
                                    Text(
                                        "Hisobingiz foydalanishga tayyor. Siz bir necha soniyadan so'ng asosiy sahifaga yo'naltirilasiz..",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge),
                                    22.ph,
                                    SizedBox(
                                      height: 125 * width / 428,
                                      width: 125 * width / 428,
                                      child: Lottie.asset(
                                        AppIcons.splashCircular,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
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
