import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/ui/auth/lets_in/lets_in_screen.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

import '../../utils/size/screen_size.dart';
import '../welcome/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _init() async {
    await Future.delayed(
      const Duration(seconds: 4),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return !StorageRepository.getBool("isFirst")
                  ? const WelcomeScreen()
                  : LetsInScreen();
            },
          ),
        );
      },
    );
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 213 * height / 926,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30 * width / 428),
            height: 419 * height / 926,
            width: 367 * width / 428,
            child: Image.asset(AppIcons.taxiLogo),
          ),
          SizedBox(
            height: 114 * height / 812,
          ),
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
    );
  }
}
