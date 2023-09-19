import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

successLocalAuth(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
          content: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30 * width / 428),
                  height: 150 * height / 926,
                  width: 150 * width / 428,
                  child: Image.asset(AppIcons.createNewPasswordDialog),
                ),
                24.ph,
                Text("Tabriklaymiz!",
                    style: Theme.of(context).textTheme.headlineSmall),
                16.ph,
                Text(
                    "Hisobingiz foydalanishga tayyor. Siz bir necha soniyadan so'ng asosiy sahifaga yo'naltirilasiz..",
                    style: Theme.of(context).textTheme.bodyLarge),
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
        );
      });
}
