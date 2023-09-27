import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

void ShowRoleDialog(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return Theme(
        data:getTheme(context)?ThemeData.dark(): ThemeData.light(),
        child: CupertinoAlertDialog(

          content: Text(
            "Siz kimsiz ?haydovchi yoki yo'lovchi",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          title: Image.asset(AppIcons.taxiLogotip),

          actions: [
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text("Haydovchi", style: Theme.of(context).textTheme.titleLarge,),
            ),
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text("Yo'lovchi", style: Theme.of(context).textTheme.titleLarge,),
            ),
          ],

        ),
      );
    },
  );
}
