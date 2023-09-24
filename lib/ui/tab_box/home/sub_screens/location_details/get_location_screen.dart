import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/ui_utils/utilitiy_function.dart';

class GetLocationScreen extends StatefulWidget {
  const GetLocationScreen({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  State<GetLocationScreen> createState() => _GetLocationScreenState();
}

class _GetLocationScreenState extends State<GetLocationScreen> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    final textLength = widget.text.length;
    final svgWidth = 50.w + (textLength * 5.0);

    return Scaffold(
      appBar: AppBar(
        leading: getIcon(
            Platform.isIOS ? AppIcons.arrowLeft : AppIcons.arrowLeft,
            context: context, onTap: () {
          Navigator.pop(context);
        }),
        title: Text(
          "Location Details",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontSize: 24.sp, fontWeight: FontWeight.w700),
        ),
        actions: [
          getIcon(
              AppIcons.moreCircle,
              context: context, onTap: () {
            Navigator.pop(context);
          }),
        ],
      ),
      body: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
        child: Stack(
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
            ),
            Stack(
              children: [
                Center(
                  child: SvgPicture.asset(
                    AppIcons.frame,
                    width: svgWidth,
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        widget.text,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: AppColors.black,
                            fontSize: 12.0.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 150.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      color: AppColors.primaryBackground.withOpacity(0.5),
                    ),
                    height: 52,
                    width: 52,
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: AppColors.primaryBackground.withOpacity(0.9),
                      ),
                      height: 36.h,
                      width: 36.w,
                      child: SvgPicture.asset(
                        AppIcons.getSvg(
                          name: AppIcons.location,
                          iconType: IconType.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 118.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.r),
                      topRight: Radius.circular(24.r)),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: GlobalButton(
                  padding: EdgeInsets.all(width/16),
                  color: AppColors.primary,
                  title: 'Continue',
                  radius: 100.r,
                  textColor: AppColors.black,
                  onTap: () {
                    // Handle button tap here.
                  },
                ),
              ),
            ),
          ],
        ),
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
