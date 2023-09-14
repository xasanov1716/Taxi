import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:taxi_app/ui/acount_setup/subscreen/fill_profile.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _init() async {
    await Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return const ProfileScreen();
          },
        ),
      );
    });
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 213*height/926,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30*width/428),
            height: 419*height/926,
            width: 367*width/428,
            child: Image.asset(AppIcons.taxiLogo),
          ),
          SizedBox(height: 114*height/812,),
          SizedBox(height: 104*width/428, width: 104*width/428, child: Lottie.asset(AppIcons.splashCircular, fit: BoxFit.cover),)
        ],
      )
    );
  }
}