import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/contact_to_driver/sub_screens/driver_detail/widgets/dr_details_bottom_nav_bar.dart';
import 'package:taxi_app/ui/contact_to_driver/sub_screens/driver_detail/widgets/get_five_widgets_function.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/ui_utils/utility_function.dart';

class DriverDetailScreen extends StatefulWidget {
  const DriverDetailScreen({super.key});

  @override
  State<DriverDetailScreen> createState() => _DriverDetailScreenState();
}

class _DriverDetailScreenState extends State<DriverDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        onTap: () {
          Navigator.pop(context);
        },
        centerTitle: false,
        title:tr('driver_details'),
        action: [
          getIcon(AppIcons.moreCircle, context: context, onTap: (){}),
          12.pw,
        ],
      ),
      // backgroundColor: AppColors.greysCale,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24 * width / figmaWidth),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: getFiveWidgetsInDrDetails(
            context,
            onCopyButtonPressed: () {},
          ),
        ),
      ),
      bottomNavigationBar: drBottomNavbar(
        context,
        onTapBottomChat: () {
          Navigator.pushNamed(context, RouteNames.chatWithDriver);
        },
        onBottomTapCall: () {},
      ),
    );
  }
}
