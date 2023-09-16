// ignore_for_file: empty_catches

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app/ui/home/widget/action_buttons.dart';
import 'package:taxi_app/ui/home/widget/global_action_button.dart';
import 'package:taxi_app/ui/home/widget/bottom_modal_sheet.dart';
import 'package:taxi_app/ui/home/widget/select_category.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

import '../../utils/colors/app_colors.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
            statusBarIconBrightness:Brightness.light ,
            statusBarColor: Colors.transparent
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

            const ActionButtons(),
            Positioned(
              bottom: 199,
              right: 24,
              child: Stack(
                children: [
                  GlobalActionButtons(color: AppColors.primary, icon: SvgPicture.asset(AppIcons.gps,), height: 52, width: 52, onTap: () {},),
                ],
              ),
            ),
            Positioned(
              bottom: 141,
              left: 0,
              right: 0,
              child: Stack(
                children: [
                  CategoryOfAddress(),
                ],
              ),
            ),
            const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Stack(
                children: [
                  BottomModalSheet(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _applyCustomMapStyle() async {
    try {
      String style = await rootBundle.loadString('assets/map_style.json');

      mapController.setMapStyle(style);
    } catch (e) {
    }
  }
}
