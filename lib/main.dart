import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 882),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const MaterialApp(
          home: Scaffold(
            body: Center(
              child: Text(
                'Привет мир',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Urbanist",
                    fontWeight: FontWeight.w500,),
              ),
            ),
          ),
        );
      },
    );
  }
}
