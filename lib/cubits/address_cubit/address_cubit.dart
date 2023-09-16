import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:taxi_app/data/repositories/address_api_repository.dart';
import 'package:taxi_app/services/api_service.dart';

import '../../data/models/universal_data.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit({required this.addressApiRepository}) : super(AddressInitial());

  final AddressApiRepository addressApiRepository;

  String kind = "house";
  String lang = "uz_UZ";

  getAddressByLatLong({required LatLng latLng}) async{
    emit(AddressLoadingState());
    UniversalData universalData = await addressApiRepository.getAddress(
      latLng: latLng,
      kind: kind,
      lang: lang,
    );
    if(universalData.error.isEmpty){
      emit(AddressSuccessState(address: universalData.data as String));
    }else{
      emit(AddressErrorState(errorText: "Bunday hudud aniqlanmadi!"));
    }
  }

  void updateKind(String newKind) {
    kind = newKind;
  }

  void updateLang(String newLang) {
    lang = newLang;
  }
}
