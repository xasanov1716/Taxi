import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/create_order/sub_screens/driver_arriving/widgets/driver_item.dart';
import 'package:taxi_app/ui/create_order/sub_screens/searching_driver/widgets/side_cancel_button.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/icons/app_icons.dart';
import '../../../tab_box/home/widgets/global_action_button.dart';

class DriverArrivingScreen extends StatefulWidget {
  const DriverArrivingScreen({super.key});

  @override
  State<DriverArrivingScreen> createState() => _DriverArrivingScreenState();
}

class _DriverArrivingScreenState extends State<DriverArrivingScreen> {
  late GoogleMapController mapController;
  bool isDriver = false;

  @override
  void initState() {
    // Future.microtask(() => driverBottomSheet(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: const CameraPosition(
              target: LatLng(37.7749, -122.4194),
              zoom: 12.0,
            ),
            onMapCreated: (GoogleMapController controller) {
              setState(() {
                mapController = controller;
                _applyCustomMapStyle();
              });
            },
            zoomControlsEnabled: false,
          ),
          Positioned(
            bottom: 325 * height / figmaHeight,
            right: 24.w,
            child: GlobalActionButtons(
              color: AppColors.primary,
              icon: SvgPicture.asset(
                AppIcons.gps,
              ),
              height: 52.h,
              width: 52.h,
              onTap: () {},
            ),
          ),
          Positioned(
              top: 66 * height / figmaHeight,
              left: 24.w,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 52.w,
                  width: 52.w,
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: getTheme(context)
                          ? AppColors.primaryBackground
                          : AppColors.dimYellow),
                  child: SvgPicture.asset(
                    AppIcons.arrowLeft2,
                    fit: BoxFit.cover,
                  ),
                ),
              )),
          Positioned(
              bottom: 24.h,
              left: (width - 230.w) / 2,
              child: SideCalcelButton(
                icon: AppIcons.image,
                title: "Driver arrive",
                onTap: () {
                  setState(() {
                    isDriver = true;
                  });
                },
              )),
          Visibility(
            visible: isDriver,
            child: Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: DriverItem(
                onDriverDetailTap: () {
                  Navigator.pushNamed(context, RouteNames.driverDetail);
                },
                cancelTap: () {
                  Navigator.pushNamed(context, RouteNames.cancelDriver);
                  setState(() {
                    isDriver = false;
                  });
                },
                chatTap: () {
                  Navigator.pushNamed(context, RouteNames.chatWithDriver);
                },
                callTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _applyCustomMapStyle() async {
    try {
      String style =
          await rootBundle.loadString('assets/styles/map_style.json');
      mapController.setMapStyle(style);
    } catch (e) {}
  }
}
