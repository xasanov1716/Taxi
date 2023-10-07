import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/create_order/sub_screens/searching_driver/widgets/side_cancel_button.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

import '../../../../utils/icons/app_icons.dart';

class SearchingDriverScreen extends StatefulWidget {
  const SearchingDriverScreen({super.key});

  @override
  State<SearchingDriverScreen> createState() => _SearchingDriverScreenState();
}

class _SearchingDriverScreenState extends State<SearchingDriverScreen> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: tr('searching_for_driver'),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: const CameraPosition(
              target: LatLng(37.7749, -122.4194),
              zoom: 12.0,
            ),
            zoomControlsEnabled: false,
            onMapCreated: (GoogleMapController controller) {
              setState(() {
                mapController = controller;
                _applyCustomMapStyle();
              });
            },
          ),
          Positioned(
            top: 15.h,
            left: (width-250.w)/2,
              child: Container(height: 150.h, width: 250.w, decoration: BoxDecoration(color: getTheme(context) ? Colors.transparent.withOpacity(0.5) : AppColors.white.withOpacity(0.5),borderRadius: BorderRadius.circular(16.r)),)),
          Positioned(
              top: 24.h,
              left: 184 * width / figmaWidth,
              child: SizedBox(
                height: 60.w,
                width: 60.w,
                child: Image.asset(
                  AppIcons.taxiLogotip,
                  fit: BoxFit.cover,
                ),
              )),
          Positioned(
              top: 100 * height / figmaHeight,
              child: SizedBox(
                  width: width,
                  child: Center(
                      child: Text(tr('searching_ride'),
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  fontFamily: "Urbanist",
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700))))),
          Positioned(
              top: 132 * height / figmaHeight,
              child: SizedBox(
                  width: width,
                  child: Center(
                      child: Text(tr('this_may_take'),
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                              fontFamily: "Urbanist",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500))))),
          Positioned(
            bottom: 36.h,
              left: (width-230.w)/2,
              child: SideCancelButton(
                title: ">> ${tr('slide_to_cancel')}",
                icon: AppIcons.sideCancel,
                onTap: (){
                Navigator.pushNamed(context, RouteNames.driverArriving);
              },)),
        ],
      ),
    );
  }

  Future<void> _applyCustomMapStyle() async {
    try {
      String style =
          await rootBundle.loadString('assets/styles/map_style.json');
      mapController.setMapStyle(style);
      // ignore: empty_catches
    } catch (e) {}
  }
}
