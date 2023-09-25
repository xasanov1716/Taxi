import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app/cubits/address_cubit/address_cubit.dart';
import 'package:taxi_app/data/models/address/address_model.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/ui_utils/utilitiy_function.dart';

import '../../../../widgets/global_appbar.dart';


class AddressAddDetailScreen extends StatefulWidget {
  const AddressAddDetailScreen({super.key,this.addressModel});
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
  TextEditingController regionController = TextEditingController();
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  void initState() {
  widget.addressModel != null? regionController.text = widget.addressModel!.street : null;
    initialCameraPosition = const CameraPosition(
      target: LatLng(41.26465, 69.21627),
      zoom: 15,
    );

    currentCameraPosition = const CameraPosition(
    target: LatLng(41.26465, 69.21627),
      zoom: 13,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: 'Add New Address',onTap: (){
        Navigator.pop(context);
      },
      action: [
        getIcon(
              AppIcons.moreCircle,
              context: context,
              onTap: () {},
            ),
            12.pw
      ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            onCameraMove: (CameraPosition cameraPosition) {
              currentCameraPosition = cameraPosition;
            },
            onCameraIdle: () {
              context.read<AddressCubit>().getAddressByLatLong(latLng: currentCameraPosition.target);
              setState(() {
                onCameraMoveStarted = false;
              });
              addAddressDialog(context,apartmentController,regionController,currentCameraPosition,(){
                AddressModel addressModel = AddressModel(
                      name: '',
                      apartment: apartmentController.text,
                      lat: currentCameraPosition.target.latitude,
                      long: currentCameraPosition.target.longitude, 
                      street: scrollAddress,);
                  addres.add(addressModel);
                  Navigator.of(context).pop();
                  setState(() { 
                    
                  });
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
            child: Icon(
              Icons.location_pin,
              color: Colors.red,
              size: onCameraMoveStarted ? 50.w : 32.w,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 70.h),
              child: BlocBuilder<AddressCubit,AddressState>(
                builder: (context, state){
                  if(state is AddressSuccessState){
                    scrollAddress = state.address;
                    return Text(
                  state.address,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 24.sp)
                );
                  }
                  return const SizedBox();
                } 
              ),
            ),
          ),
        ],
      ),
    );
  }
}
