import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app/blocs/location_bloc/location_bloc.dart';
import 'package:taxi_app/cubits/address_cubit/address_cubit.dart';
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
  late CameraPosition initialCameraPosition;
  late CameraPosition currentCameraPosition;
  bool onCameraMoveStarted = false;
  String address = "";

  Future<void> _followMe({required CameraPosition cameraPosition}) async {
    final GoogleMapController controller = mapController;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(cameraPosition),
    );
  }

  @override
  void initState() {
    initialCameraPosition = CameraPosition(
        target: BlocProvider.of<LocationBloc>(context).latLong, zoom: 13);
    currentCameraPosition = CameraPosition(
        target: BlocProvider.of<LocationBloc>(context).latLong, zoom: 13);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AddressCubit, AddressState>(
        builder: (context, state) {
          return AnnotatedRegion(
            value: const SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light,
                statusBarColor: Colors.transparent),
            child: Stack(
              children: [
                GoogleMap(
                  onCameraMoveStarted: () {
                    setState(() {
                      onCameraMoveStarted = true;
                    });
                  },
                  onCameraMove: (CameraPosition cameraPosition) {
                    currentCameraPosition = cameraPosition;
                  },
                  onCameraIdle: () {
                    context.read<AddressCubit>().getAddressByLatLong(
                        latLng: currentCameraPosition.target);
                    setState(() {
                      onCameraMoveStarted = false;
                    });
                  },
                  mapType: context.watch<AddressCubit>().mapType,
                  initialCameraPosition: CameraPosition(
                    target: initialCameraPosition.target,
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
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 150.h),
                    child: Container(
                      padding: EdgeInsets.all(6.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.black38,
                      ),
                      child: Text(
                        address,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                    child: Image.asset(
                  AppIcons.myLocation,
                  height: onCameraMoveStarted ? 50.w : 40.w,
                  width: onCameraMoveStarted ? 50.w : 32.w,
                )),
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
                    onTap: () {
                      _followMe(cameraPosition: initialCameraPosition);
                    },
                  ),
                ),
                Positioned(
                  bottom: height / 6,
                  left: 0,
                  right: 0,
                  child: CategoryOfAddress(
                    latLng: currentCameraPosition.target,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: HomeAddressSelector(
                    onTab: () {
                      addressSelectDialog(context);
                    },
                  ),
                ),
                const Visibility(
                  visible: false,
                  child: Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: AddressSelectedView(),
                  ),
                ),
              ],
            ),
          );
        },
        listener: (context, state) {
          if (state is AddressLoadingState) {
            setState(() {});
          }

          if (state is AddressSuccessState) {
            setState(() {
              address = state.address;
            });
          }
          if (state is AddressErrorState) {
            setState(() {
              address = state.errorText;
            });
          }
        },
      ),
    );
  }

  Future<void> _applyCustomMapStyle() async {
    try {
      String style =
          await rootBundle.loadString('assets/styles/map_style.json');
      mapController.setMapStyle(style);
    } catch (e) {
      throw ();
    }
  }
}
