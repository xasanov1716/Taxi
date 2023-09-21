import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app/ui/tab_box/home/dialogs/address_select_dialog.dart';
import 'package:taxi_app/ui/tab_box/home/widgets/action_buttons.dart';
import 'package:taxi_app/ui/tab_box/home/widgets/address_selected_view.dart';
import 'package:taxi_app/ui/tab_box/home/widgets/global_action_button.dart';
import 'package:taxi_app/ui/tab_box/home/widgets/home_address_selector.dart';
import 'package:taxi_app/ui/tab_box/home/widgets/select_category.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
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
            statusBarIconBrightness: Brightness.light,
            statusBarColor: Colors.transparent),
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
              bottom: height / 4,
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
              bottom: height / 6,
              left: 0,
              right: 0,
              child: CategoryOfAddress(),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: HomeAddressSelector(
                onTab: (){
                  addressSelectDialog(context);
                },
              ),
            ),
            const Visibility(
              visible: false, // <= Ko'rish
              child: Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: AddressSelectedView(),
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
