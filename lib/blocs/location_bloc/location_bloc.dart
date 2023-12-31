import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'location_event.dart';

part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial()) {
    on<GetLocationEvent>(_getLocation);
    on<UpdateLocationEvent>(updateLatLong);
  }

  LatLng latLong = const LatLng(41.234, 69.71);
  LatLng initialLatLong = const LatLng(41.234, 69.71);

  _getLocation(GetLocationEvent getLocationEvent, Emitter<LocationState> emit) async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    try {
      emit(LocationLoadingState());
      locationData = await location.getLocation();
      initialLatLong = LatLng(
        locationData.latitude!,
        locationData.longitude!,
      );
      latLong = LatLng(
        locationData.latitude!,
        locationData.longitude!,
      );

      emit(LocationSuccessState());
    } catch (er) {
      emit(LocationErrorState(errorText: er.toString()));
      debugPrint("LOCATION ERROR:$er");
    }

    location.enableBackgroundMode();

    // location.onLocationChanged.listen((LocationData newLocation)
    // {
    //   LatLng latLng = LatLng(newLocation.latitude!, newLocation.longitude!);
    //   // addNewMarker(latLng);
    //   debugPrint("LONGITUDE:${newLocation.longitude}");
    // });
  }

  updateLatLong(UpdateLocationEvent updateLocationEvent, Emitter<LocationState> emit) {
    emit(LocationLoadingState());
    latLong = updateLocationEvent.newLatLng;
    emit(LocationSuccessState());
  }
}
