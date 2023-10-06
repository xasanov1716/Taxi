import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_app/data/models/driver/driver_model.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';
import 'package:url_launcher/url_launcher.dart';

Container driverBodyInfoWidget(BuildContext context, DriverModel driver) {
  return Container(
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: getTheme(context) ? AppColors.dark3 : AppColors.white,
    ),
    child: Column(
      children: [
        customLabelRow(context, 'Full Name', driver.fullName),
        customLabelRow(context, 'Telegram Link', driver.telegramLink),
        customLabelRow(context, 'Email', driver.email),
        customLabelRow(context, 'Gender', driver.gender),
        customLabelRow(context, 'From To Text', driver.fromToText),
        customLabelRow(context, 'Empty Places', driver.emptyPlaces.toString()),
        customLabelRow(context, 'About Driver', driver.aboutDriver),
        customLabelRow(context, 'Car Model', driver.carModel),
        customLabelRow(context, 'Passenger Type', driver.passengerType),
        customLabelRow(context, 'Price', driver.price.toString()),
        customLabelRow(context, 'Has Delivery', driver.hasDelivery.toString()),
        customLabelRow(context, 'Has Roof Top', driver.hasRoofTop.toString()),
        customLabelRow(context, 'Is Online', driver.isOnline.toString()),
        customLabelRow(context, 'Last Online Time', driver.lastOnlineTime),
        customLabelRow(context, 'Has Fil    led', driver.hasFilled.toString()),
        customLabelRow(context, 'Car Number', driver.carNumber),
      ],
    ),
  );
}

Row customLabelRow(BuildContext context, String title, String body) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title, style: Theme.of(context).textTheme.bodyLarge),
      Flexible(
        child: Linkify(
          text: body,
          onOpen: (link) async {
            if (await launchUrl(Uri.parse(link.url))) {
              throw Exception('Could not launch ${link.url}');
            }
          },
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.right,
        ),
      )
    ],
  );
}

Column clientHeaderInfoWidget(BuildContext context, DriverModel driver) {
  return Column(
    children: [
      Container(
        width: 120,
        clipBehavior: Clip.antiAlias,
        decoration: const ShapeDecoration(
          shape: CircleBorder(),
        ),
        child: CachedNetworkImage(
          imageUrl: driver.imageUrl,
          errorWidget: (context, url, error) {
            return NamePlaceholder(name: driver.fullName);
          },
        ),
      ),
      20.ph,
      Text(
        driver.fullName,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
            ),
      ),
      20.ph,
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(driver.phoneNumber,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  )),
          IconButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: driver.phoneNumber));
              Fluttertoast.showToast(
                  msg: '✅ Copy phone number: ${driver.phoneNumber}',
                  backgroundColor: AppColors.success,
                  toastLength: Toast.LENGTH_LONG);
            },
            icon: SvgPicture.asset(AppIcons.copy),
            splashRadius: 30,
          )
        ],
      ),
    ],
  );
}

class IconContainerWidget extends StatelessWidget {
  const IconContainerWidget({
    Key? key,
    this.onTap,
    required this.icon,
  }) : super(key: key);

  final VoidCallback? onTap;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: Ink(
        padding: const EdgeInsets.all(20),
        decoration: const ShapeDecoration(
          shape: CircleBorder(),
          color: AppColors.primary,
        ),
        child: SvgPicture.asset(
          AppIcons.getSvg(
            name: icon,
            iconType: IconType.bold,
          ),
          width: 24.w,
        ),
      ),
    );
  }
}

class NamePlaceholder extends StatelessWidget {
  final String name;

  NamePlaceholder({required this.name});

  // Function to generate a random light color
  Color _generateRandomColor() {
    final random = Random();
    final red = 200 + random.nextInt(55); // Adjust the range as needed
    final green = 200 + random.nextInt(55);
    final blue = 200 + random.nextInt(55);
    return Color.fromRGBO(red, green, blue, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    final firstLetter = name.isNotEmpty ? name[0].toUpperCase() : '?'; // Use '?' if name is empty

    return Container(
      width: 50, // Adjust the size as needed
      height: 50,
      decoration: BoxDecoration(
        color: _generateRandomColor(),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          firstLetter,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
