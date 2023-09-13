import 'package:flutter/cupertino.dart';

class AppColors {
  //-----------------MAIN-------------------------

  static const Color primary = Color(0xFFFEBB1B);
  static const Color secondary = Color(0xFFFFD300);

  //-----------------ALERT  STATUS-------------------------

  static const Color success = Color(0xFF4AED80);
  static const Color info = Color(0xFF246BFD);
  static const Color warning = Color(0xFFFACC15);
  static const Color error = Color(0xFFF75555);
  static const Color disabled = Color(0xFFD8D8D8);
  static const Color disabledButton = Color(0xFFEBAD18);

  //----------------- GREYSCALE -------------------------

  static const Color c_900 = Color(0xFF212121);
  static const Color c_800 = Color(0xFF424242);
  static const Color c_700 = Color(0xFF616161);
  static const Color c_600 = Color(0xFF757575);
  static const Color c_500 = Color(0xFF9E9E9E);
  static const Color c_400 = Color(0xFFBDBDBD);
  static const Color c_300 = Color(0xFFE0E0E0);
  static const Color c_200 = Color(0xFFEEEEEE);
  static const Color c_100 = Color(0xFFF5F5F5);
  static const Color c_50 = Color(0xFFFAFAFA);

  //----------------- GRADIENTS -------------------------

  static const Gradient gradientOrangeYellow = LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      colors: [
         Color(0xFFFEBB1B),
         Color(0xFFFFC740),
      ]);

  static const Gradient gradientBlue = LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      colors: [
         Color(0xFF335EF7),
         Color(0xFF5F82FF),
      ]);

  static const Gradient gradientPurple = LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      colors: [
         Color(0xFF7210FF),
         Color(0xFF9D59FF),
      ]);

  static const Gradient gradientYellow = LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      colors: [
         Color(0xFFFACC15),
         Color(0xFFFFE580),
      ]);

  static const Gradient gradientGreen = LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      colors: [
         Color(0xFF22BB9C),
         Color(0xFF35DEBC),
      ]);

  static const Gradient gradientRed = LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      colors: [
         Color(0xFFFF4D67),
         Color(0xFFFF8A9B),
      ]);

  //----------------- DARK COLORS -------------------------

  static const Color dark1 = Color(0xFF181A20);
  static const Color dark2 = Color(0xFF1F222A);
  static const Color dark3 = Color(0xFF35383F);

  //----------------- OTHERS COLOR ------------------------

}
