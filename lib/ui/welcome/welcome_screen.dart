import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/ui/onboarding/carousel_pages/carousel_pages.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Future<void> _init() async {
    await Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return const CarouselPages();
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
        fit: StackFit.loose,
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              AppIcons.splashScreen,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height/2,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        AppColors.black.withOpacity(0.9)
                      ]
                  )
              ),
            ),
          ),
          Positioned(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32 * width / 428),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return AppColors.gradientOrangeYellow.createShader(bounds);
                    },
                    child: Text(
                      "Xush kelibsiz 👋",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 30.sp, fontWeight: FontWeight.w700, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 12.h
                  ),
                  Text(
                    "Dastyor Taxi",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.copyWith(fontSize: 60.sp, fontWeight: FontWeight.w900, color: AppColors.orange),
                  ),
                  SizedBox(
                    height: 24 * height / 926,
                  ),
                  Text(
                    "Kuningizni ajoyib qilish uchun asrning eng yaxshi taksi bron qilish ilovasi!",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16.sp),
                  ),
                  SizedBox(
                    height: 48 * height / 926,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }
}
