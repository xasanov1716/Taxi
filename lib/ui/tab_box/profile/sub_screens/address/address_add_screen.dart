import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app/blocs/address_bloc/address_bloc.dart';
import 'package:taxi_app/cubits/address_cubit/address_cubit.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/data/models/address_model/address_model.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/utils/constants/storage_keys.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/ui_utils/utilitiy_function.dart';

import '../../../../../data/models/status/form_status.dart';
import '../../../../../utils/colors/app_colors.dart';
import '../../../../../utils/theme/get_theme.dart';
import '../../../../../utils/ui_utils/error_message_dialog.dart';
import '../../../../widgets/global_button.dart';

class AddressAddDetailScreen extends StatefulWidget {
  const AddressAddDetailScreen({super.key, this.addressModel});
  final AddressModel? addressModel;

  @override
  State<AddressAddDetailScreen> createState() => _AddressAddDetailScreenState();
}

class _AddressAddDetailScreenState extends State<AddressAddDetailScreen> {
  late CameraPosition initialCameraPosition;
  late CameraPosition currentCameraPosition;
  bool onCameraMoveStarted = false;
  String scrollAddress = '';
  TextEditingController apartmentController = TextEditingController();
  TextEditingController orientationController = TextEditingController();
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  void initState() {
    widget.addressModel != null
        ? orientationController.text = widget.addressModel!.orientation
        : null;
    widget.addressModel != null
        ? apartmentController.text = widget.addressModel!.apartment
        : null;
    initialCameraPosition = widget.addressModel != null ? CameraPosition(
      target: LatLng(widget.addressModel!.latitude, widget.addressModel!.longitude),
      zoom: 15,
    ) : const CameraPosition(
      target: LatLng(41.26465, 69.21627),
      zoom: 15,
    );

    currentCameraPosition = widget.addressModel != null ? CameraPosition(
      target: LatLng(widget.addressModel!.latitude, widget.addressModel!.longitude),
      zoom: 15,
    ) : const CameraPosition(
      target: LatLng(41.26465, 69.21627),
      zoom: 13,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title:  widget.addressModel != null ? 'Update Address' : 'Add New Address',
        onTap: () {
          Navigator.pop(context);
        },
        action: [
          widget.addressModel != null
              ? getIcon(AppIcons.delete, context: context, onTap: (){
                BlocProvider.of<AddressBloc>(context).add(DeleteAddressEvent(addressId: widget.addressModel!.addressId));
                Navigator.pop(context);
          }) : getIcon(
            AppIcons.moreCircle,
            context: context,
            onTap: () {},
          ),
          12.pw
        ],
      ),
      body: BlocConsumer<AddressBloc, AddressStates>(
        builder: (context, state) {
          return Stack(
            children: [
              GoogleMap(
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
                liteModeEnabled: false,
                myLocationEnabled: false,
                padding: EdgeInsets.all(16.w),
                zoomGesturesEnabled: true,
                zoomControlsEnabled: true,
                mapType: MapType.normal,
                onCameraMoveStarted: () {
                  setState(() {
                    onCameraMoveStarted = true;
                  });
                },
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                initialCameraPosition: initialCameraPosition,
              ),
              Align(
                  child: Image.asset(
                    AppIcons.myLocation,
                    height: onCameraMoveStarted ? 70.w : 60.w,
                    width: onCameraMoveStarted ? 70.w : 62.w,
                  )),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
                  child: BlocBuilder<AddressCubit, AddressState>(builder: (context, state) {
                    if (state is AddressSuccessState) {
                      scrollAddress = state.address;
                      return Container(
                        decoration: BoxDecoration(
                          color: (getTheme(context) ? AppColors.dark1 : AppColors.primary).withOpacity(0.7),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Text(state.address,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 24.sp)),
                      );
                    }
                    return const SizedBox();
                  }),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(24.w),
                  child: SizedBox(
                    height: 70.h,
                    child: GlobalButton(
                      title: widget.addressModel != null ? 'Update Address' : 'Add Address',
                      onTap: () {
                        if(widget.addressModel == null){
                          addAddressDialog(context, apartmentController,
                              orientationController, currentCameraPosition, () {
                                AddressModel addressModel = AddressModel(
                                  userId: StorageRepository.getString(StorageKeys.userId),
                                  userType: StorageRepository.getString(StorageKeys.userRole),
                                  addressId: "",
                                  addressText: scrollAddress,
                                  apartment: apartmentController.text,
                                  latitude: currentCameraPosition.target.latitude,
                                  longitude: currentCameraPosition.target.longitude,
                                  orientation: orientationController.text,
                                );
                                BlocProvider.of<AddressBloc>(context).add(AddAddressEvent(addressModel: addressModel));
                                Navigator.of(context).pop();
                                setState(() {});
                              });
                        }else{
                          addAddressDialog(context, apartmentController,
                              orientationController, currentCameraPosition, () {
                                AddressModel addressModel = AddressModel(
                                  userId: StorageRepository.getString(StorageKeys.userId),
                                  userType: StorageRepository.getString(StorageKeys.userRole),
                                  addressId: widget.addressModel!.addressId,
                                  addressText: scrollAddress,
                                  apartment: apartmentController.text,
                                  latitude: currentCameraPosition.target.latitude,
                                  longitude: currentCameraPosition.target.longitude,
                                  orientation: orientationController.text,
                                );
                                BlocProvider.of<AddressBloc>(context).add(UpdateAddressEvent(addressModel: addressModel));
                                Navigator.of(context).pop();
                                setState(() {});
                              });
                        }
                      },
                      radius: 100.r,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              )
            ],
          );
        },
        listener: (context, state) {
          if (state.status == FormStatus.success) {
            debugPrint("Success");
            Navigator.pop(context);
          }
          if(state.status == FormStatus.failure){
            showErrorMessage(message: "Error", context: context);
          }
        },
      ),
    );
  }
}
