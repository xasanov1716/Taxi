import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app/ui/tab_box/home/sub_screens/location_details/widgets/get_location_middle_stack.dart';
import 'package:taxi_app/ui/tab_box/home/sub_screens/location_details/widgets/location_detail_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/size/screen_size.dart';

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
    return Scaffold(
      appBar: GetLocationAppBar(
        arrowLeftOnTap: () {
          Navigator.pop(context);
        },
        moreOnTap: () {},
        title: "Location Details",
      ),
      body: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
        child: Stack(
          children: [
            GoogleMap(
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
            GetLocationMiddleStack(text: widget.text),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 118.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.r), topRight: Radius.circular(24.r)),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: GlobalButton(
                  padding: EdgeInsets.all(width / 16),
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
    String style = await rootBundle.loadString('assets/styles/map_style.json');
    mapController.setMapStyle(style);
  }
}
