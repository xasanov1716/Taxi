import 'package:flutter/material.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class EmptyBookings extends StatelessWidget {
  const EmptyBookings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          getTheme(context)?AppIcons.emptyBookingsDark:AppIcons.emptyBookings,
          height: 220 * height / figmaHeight,
          width: 225 * width / figmaWidth,
        ),
        48.ph,
        Text("You have no active taxi booking",style: Theme.of(context).textTheme.headlineSmall,),
        12.ph,
        Text("You don't have an active taxi booking at this time",style: Theme.of(context).textTheme.bodyLarge)
      ],
    );
  }
}
