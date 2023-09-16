import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/utils/fonts/text_styles.dart';
import '../colors/app_colors.dart';

class AppTheme {

  //LIGHT

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
    primaryColor: AppColors.primary,
    hintColor: AppColors.c_500,
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

        displayLarge: AppTextStyle.h1Bold.copyWith(color: AppColors.white),
        displayMedium: AppTextStyle.h2Bold.copyWith(color: AppColors.white),
        displaySmall: AppTextStyle.h3Bold.copyWith(color: AppColors.white),
        //headline
        headlineMedium: AppTextStyle.h4Bold.copyWith(color: AppColors.white),
        headlineSmall: AppTextStyle.h5Bold.copyWith(color: AppColors.white),
        //title
        titleLarge: AppTextStyle.h6Bold.copyWith(color: AppColors.white),
        titleMedium: AppTextStyle.bodyXlargeMedium,
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

        labelSmall: AppTextStyle.bodyXsmallMedium.copyWith(color: AppColors.white),
        //body
        bodyLarge: AppTextStyle.bodyLargeMedium.copyWith(color: AppColors.white),
        bodyMedium: AppTextStyle.bodyMediumMedium.copyWith(color: AppColors.white),
        bodySmall: AppTextStyle.bodySmallMedium.copyWith(color: AppColors.white)),

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
          letterSpacing: 0.2,
        ),
        unselectedLabelStyle: TextStyle(
          color: AppColors.c_500,
          fontSize: 10.sp,
          fontStyle: FontStyle.normal,
          fontFamily: "Urbanist",
          fontWeight: FontWeight.w700,
          letterSpacing: 0.2,
        ),
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
        letterSpacing: 0.2,
      ),
      contentTextStyle: TextStyle(
        color: AppColors.c_900,
        fontSize: 16.sp,
        fontStyle: FontStyle.normal,
        fontFamily: "Urbanist",
        fontWeight: FontWeight.w400,
        letterSpacing: 0.2,
      ),
    ),
    dividerTheme: const DividerThemeData(color: AppColors.c_200),

    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.c_50,
      filled: true,
      hintStyle: AppTextStyle.bodyMediumRegular,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    ),
    useMaterial3: true,
    switchTheme: const SwitchThemeData(
      thumbColor: MaterialStatePropertyAll(AppColors.white),
    ),
    colorScheme: const ColorScheme(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: Color(0xFF1F222A),
      background: Color(0xFF1F222A),
      error: AppColors.error,
      onPrimary: Color(0xFFFFFFFF),
      onSecondary: Color(0xFFFFFFFF),
      onSurface: Color(0xffff3b2948),
      onBackground: AppColors.dark3,
      onError: Color(0xffff690005),
      brightness: Brightness.dark,
    ),

  );



  //DARK

  static ThemeData darkTheme = ThemeData(
    hintColor: AppColors.c_500,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      hintStyle: AppTextStyle.bodyMediumRegular,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
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
        fontStyle: FontStyle.normal,
      ),
      backgroundColor: AppColors.dark1,
      iconTheme: const IconThemeData(
        color: AppColors.primary,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.dark1,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    textTheme: TextTheme(

        //display
        displayLarge: AppTextStyle.h1Bold.copyWith(color: AppColors.white),
        displayMedium: AppTextStyle.h2Bold.copyWith(color: AppColors.white),
        displaySmall: AppTextStyle.h3Bold.copyWith(color: AppColors.white),
        //headline
        headlineMedium: AppTextStyle.h4Bold.copyWith(color: AppColors.white),
        headlineSmall: AppTextStyle.h5Bold.copyWith(color: AppColors.white),
        //title
        titleLarge: AppTextStyle.h6Bold.copyWith(color: AppColors.white),
        titleMedium: AppTextStyle.bodyXlargeMedium.copyWith(color: AppColors.white),
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
        labelSmall: AppTextStyle.bodyXsmallMedium.copyWith(color: AppColors.white),
        //body
        bodyLarge: AppTextStyle.bodyLargeMedium.copyWith(color: AppColors.white),
        bodyMedium: AppTextStyle.bodyMediumMedium.copyWith(color: AppColors.white),
        bodySmall: AppTextStyle.bodySmallMedium.copyWith(color: AppColors.white)),

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
          letterSpacing: 0.2,
        ),
        unselectedLabelStyle: TextStyle(
          color: AppColors.c_500,
          fontSize: 10.sp,
          fontStyle: FontStyle.normal,
          fontFamily: "Urbanist",
          fontWeight: FontWeight.w700,
          letterSpacing: 0.2,
        ),
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
          letterSpacing: 0.2,
        ),
        contentTextStyle: TextStyle(

            color: AppColors.c_900,
            fontSize: 16.sp,
            fontStyle: FontStyle.normal,
            fontFamily: "Urbanist",
            fontWeight: FontWeight.w400,
            letterSpacing: 0.2)),
    useMaterial3: true,
    switchTheme: const SwitchThemeData(
      thumbColor: MaterialStatePropertyAll(AppColors.white),
      // trackColor: MaterialStatePropertyAll(AppColors.white),
      // trackOutlineColor: MaterialStatePropertyAll(AppColors.primary),
      // overlayColor: MaterialStatePropertyAll(AppColors.primary),
    ),
    colorScheme: const ColorScheme(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: Color(0xFF1F222A),
      background: Color(0xFF1F222A),
      error: AppColors.error,
      onPrimary: Color(0xFFFFFFFF),
      onSecondary: Color(0xFFFFFFFF),
      onSurface: Color(0xffff3b2948),
      onBackground: AppColors.dark3,
      onError: Color(0xffff690005),
      brightness: Brightness.dark,
    ),

  );
}
