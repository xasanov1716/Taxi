import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Future<void> _init() async {
    await Future.delayed(const Duration(seconds: 100), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return const WelcomeScreen();
          },
        ),
      );
    });
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              AppIcons.splashScreen,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32 * width / 428),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Welcome to 👋", style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 34.sp, fontWeight: FontWeight.w700, color: Colors.white),),
                SizedBox(height: 12.h,),
                Text(
                  "Taxio",
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(fontSize: 96.sp, fontWeight: FontWeight.w900,color: AppColors.yellowTransparent),
                ),
                SizedBox(
                  height: 24 * height / 926,
                ),
                Text(
                  "The best taxi booking app of the century to make your day great!",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 16.sp),
                ),
                SizedBox(
                  height: 48 * height / 926,
                )
              ],
            ),
          ))
        ],
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }
}
