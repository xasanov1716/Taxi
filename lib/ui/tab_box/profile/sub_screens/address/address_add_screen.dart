import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app/cubits/address_cubit/address_cubit.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/address/widgets/show_modal_botton_sheet_address_add_screen.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/ui/widgets/global_input.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

class AddressAddDetailScreen extends StatefulWidget {
  const AddressAddDetailScreen({super.key});

  @override
  State<AddressAddDetailScreen> createState() => _AddressAddDetailScreenState();
}

class _AddressAddDetailScreenState extends State<AddressAddDetailScreen> {
  late GoogleMapController mapController;
  TextEditingController addressDetailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        return Scaffold(
          appBar: GlobalAppBar(
            title: "Add New Address",
            action: [
              Padding(
                padding: EdgeInsets.only(right: 24.w),
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(AppIcons.moreCircle),
                ),
              )
            ],
            onTap: () {
              Navigator.pop(context);
            },
          ),
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
                Align(
                    child: SizedBox(
                      height: 61.h,
                      width: 52.w,
                      child: Image.asset(
                        AppIcons.myLocation,
                        fit: BoxFit.cover,
                      ),
                    )),
                Visibility(
                  visible: false, // <= Ko'rish
                  child: Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: GlobalTextField(
                      hintText: "Address Details",
                      suffixIcon: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: SvgPicture.asset(AppIcons.location)),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet<void>(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(32),
                              topLeft: Radius.circular(32),
                            ),
                          ),
                          backgroundColor:
                          Theme
                              .of(context)
                              .scaffoldBackgroundColor,
                          context: context,
                          builder: (BuildContext context) {
                            return AddressAddDialog();
                          },
                        );
                      },
                      child: const Text(
                        "show dialog",
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
          ),
        );
      },
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
