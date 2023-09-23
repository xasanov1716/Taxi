import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app/cubits/address_cubit/address_cubit.dart';
import 'package:taxi_app/services/api_service.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/address/widgets/show_modal_botton_sheet_address_add_screen.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/ui/widgets/global_input.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';

class AddressAddDetailScreen extends StatefulWidget {
  const AddressAddDetailScreen({super.key});

  @override
  State<AddressAddDetailScreen> createState() => _AddressAddDetailScreenState();
}

class _AddressAddDetailScreenState extends State<AddressAddDetailScreen> {
  late GoogleMapController mapController;
  TextEditingController addressDetailController = TextEditingController();
  ApiService apiService = ApiService();
  LatLng latLng = const LatLng(37.7749, -122.4194);
  String locationName = "";
  FocusNode focusNode = FocusNode();

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
                  onCameraMove: (argument) {
                    latLng = LatLng(
                        argument.target.latitude, argument.target.longitude);
                    locationName = context
                        .read<AddressCubit>()
                        .getAddressByLatLong(latLng: latLng);
                    print(locationName);
                  },
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
                Positioned(
                  top: height/5,
                    left: 0,
                    right: 0,
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(locationName.isEmpty
                        ? "Aniqlanmagan hudud"
                        : locationName),
                    Image.asset(
                      AppIcons.myLocation,
                      height: 61.h,
                      width: 52.w,
                      fit: BoxFit.fill,
                    ),
                  ],
                )),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 50,
                  child: Visibility(
                      visible: true,
                      child: GlobalTextField(
                        focusNode: focusNode,
                          hintText: "Apartment")),
                ),
                // Positioned(
                //     bottom: 100,
                //     left: 0,
                //     right: 0,
                //     child: Text(context
                //         .read<AddressCubit>()
                //         .getAddressByLatLong(latLng: latLng).toString())),
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
                              Theme.of(context).scaffoldBackgroundColor,
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
