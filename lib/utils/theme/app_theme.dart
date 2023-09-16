import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../colors/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(AppColors.white),
        overlayColor: const MaterialStatePropertyAll(AppColors.c_200),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            side: const BorderSide(color: AppColors.c_200),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    ),
    scaffoldBackgroundColor: AppColors.white,
    iconTheme: const IconThemeData(color: AppColors.disabledButton),
    appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
          color: AppColors.c_900,
          fontSize: 24.sp,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
        ),
        backgroundColor: AppColors.white,
        iconTheme: const IconThemeData(color: AppColors.c_900),
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColors.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark)),
    textTheme: TextTheme(
        //display
        displayLarge: TextStyle(
            color: AppColors.c_900,
            fontSize: 57.sp,
            fontWeight: FontWeight.w800,
            fontFamily: 'Urbanist'),
        displayMedium: TextStyle(
            color: AppColors.c_900,
            fontSize: 45.sp,
            fontWeight: FontWeight.w700,
            fontFamily: 'Urbanist'),
        displaySmall: TextStyle(
            color: AppColors.c_900,
            fontSize: 36.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Urbanist'),
        //headline
        headlineLarge: TextStyle(
            color: AppColors.c_900,
            fontSize: 32.sp,
            fontWeight: FontWeight.w700,
            fontFamily: 'Urbanist'),
        headlineMedium: TextStyle(
            color: AppColors.c_900,
            fontSize: 28.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Urbanist'),
        headlineSmall: TextStyle(
            color: AppColors.c_900,
            fontSize: 24.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'Urbanist'),
        //title
        titleLarge: TextStyle(
            color: AppColors.c_900,
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
            fontFamily: 'Urbanist'),
        titleMedium: TextStyle(
            color: AppColors.c_900,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Urbanist'),
        titleSmall: TextStyle(
            color: AppColors.c_900,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Urbanist'),
        //label
        labelLarge: TextStyle(
            color: AppColors.c_900,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Urbanist'),
        labelMedium: TextStyle(
            color: AppColors.c_900,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Urbanist'),
        labelSmall: TextStyle(
            color: AppColors.c_900,
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Urbanist'),
        //body
        bodyLarge: TextStyle(
            color: AppColors.c_900,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Urbanist'),
        bodyMedium: TextStyle(
            color: AppColors.c_900,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Urbanist'),
        bodySmall: TextStyle(
            color: AppColors.c_900,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Urbanist')),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(
            color: AppColors.primary,
            fontSize: 10.sp,
            fontStyle: FontStyle.normal,
            fontFamily: "Urbanist",
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2),
        unselectedLabelStyle: TextStyle(
            color: AppColors.c_500,
            fontSize: 10.sp,
            fontStyle: FontStyle.normal,
            fontFamily: "Urbanist",
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2),
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.c_500),
    dialogTheme: DialogTheme(
        backgroundColor: AppColors.white,
        alignment: Alignment.center,
        titleTextStyle: TextStyle(
            color: AppColors.c_900,
            fontSize: 24.sp,
            fontStyle: FontStyle.normal,
            fontFamily: "Urbanist",
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2),
        contentTextStyle: TextStyle(
            color: AppColors.c_900,
            fontSize: 16.sp,
            fontStyle: FontStyle.normal,
            fontFamily: "Urbanist",
            fontWeight: FontWeight.w400,
            letterSpacing: 0.2)),
    dividerTheme: const DividerThemeData(color: AppColors.c_200),
    inputDecorationTheme: const InputDecorationTheme(),
  );

  static ThemeData darkTheme = ThemeData(
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: AppColors.dark2,
    ),
    dividerTheme: const DividerThemeData(color: AppColors.dark3),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: const MaterialStatePropertyAll(AppColors.dark2),
      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.dark2),
      )),
    )),
    scaffoldBackgroundColor: AppColors.dark1,
    iconTheme: const IconThemeData(color: AppColors.disabledButton),
    appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
            color: AppColors.white,
            fontSize: 24.sp,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal),
        backgroundColor: AppColors.dark1,
        iconTheme: const IconThemeData(color: AppColors.primary),
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColors.dark1,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light)),
    textTheme: TextTheme(
        //display
        displayLarge: TextStyle(
            color: AppColors.white,
            fontSize: 57.sp,
            fontWeight: FontWeight.w800,
            fontFamily: 'Urbanist'),
        displayMedium: TextStyle(
            color: AppColors.white,
            fontSize: 45.sp,
            fontWeight: FontWeight.w700,
            fontFamily: 'Urbanist'),
        displaySmall: TextStyle(
            color: AppColors.white,
            fontSize: 36.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Urbanist'),
        //headline
        headlineLarge: TextStyle(
            color: AppColors.white,
            fontSize: 32.sp,
            fontWeight: FontWeight.w700,
            fontFamily: 'Urbanist'),
        headlineMedium: TextStyle(
            color: AppColors.white,
            fontSize: 28.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Urbanist'),
        headlineSmall: TextStyle(
            color: AppColors.white,
            fontSize: 24.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'Urbanist'),
        //title
        titleLarge: TextStyle(
            color: AppColors.white,
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
            fontFamily: 'Urbanist'),
        titleMedium: TextStyle(
            color: AppColors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Urbanist'),
        titleSmall: TextStyle(
            color: AppColors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Urbanist'),
        //label
        labelLarge: TextStyle(
            color: AppColors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Urbanist'),
        labelMedium: TextStyle(
            color: AppColors.white,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Urbanist'),
        labelSmall: TextStyle(
            color: AppColors.white,
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Urbanist'),
        //body
        bodyLarge: TextStyle(
            color: AppColors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Urbanist'),
        bodyMedium: TextStyle(
            color: AppColors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Urbanist'),
        bodySmall: TextStyle(
            color: AppColors.white,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Urbanist')),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(
            color: AppColors.primary,
            fontSize: 10.sp,
            fontStyle: FontStyle.normal,
            fontFamily: "Urbanist",
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2),
        unselectedLabelStyle: TextStyle(
            color: AppColors.c_500,
            fontSize: 10.sp,
            fontStyle: FontStyle.normal,
            fontFamily: "Urbanist",
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2),
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.c_500),
    dialogTheme: DialogTheme(
        backgroundColor: AppColors.dark2,
        alignment: Alignment.center,
        titleTextStyle: TextStyle(
            color: AppColors.primary,
            fontSize: 24.sp,
            fontStyle: FontStyle.normal,
            fontFamily: "Urbanist",
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2),
        contentTextStyle: TextStyle(
            color: AppColors.c_900,
            fontSize: 16.sp,
            fontStyle: FontStyle.normal,
            fontFamily: "Urbanist",
            fontWeight: FontWeight.w400,
            letterSpacing: 0.2)),
  );
}
