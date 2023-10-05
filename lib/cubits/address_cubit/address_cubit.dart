import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:taxi_app/data/repositories/address_api_repository.dart';
import 'package:taxi_app/utils/constants/constants.dart';
import '../../data/models/universal_data.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit({required this.addressApiRepository}) : super(AddressInitial());

  final AddressApiRepository addressApiRepository;

  String kind = "house";
  String lang = "uz_UZ";
  MapType mapType = MapType.hybrid;
  String key = '';

  Future<List<List<String>>> getDataFromDocuments() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(FirebaseCollections.yandexApiKeys) // Replace with your collection name
        .get();

    List<List<String>> dataLists = [];

    querySnapshot.docs.forEach((doc) {
      Map<String, dynamic> documentData = doc.data() as Map<String, dynamic>;
      List<String> dataList = documentData.values.map((value) => value.toString()).toList();
      dataLists.add(dataList);
    });

    return dataLists;
  }

  String getRandomItemFromListOfLists(List<List<String>> listOfLists) {
    if (listOfLists.isEmpty) {
      return ''; // Return null if the list is empty
    }

    final random = Random();
    final randomIndex = random.nextInt(listOfLists.length);

    // Get a random list from the list of lists
    List<String> randomList = listOfLists[randomIndex];

    if (randomList.isEmpty) {
      return ''; // Return null if the selected list is empty
    }

    final randomItemIndex = random.nextInt(randomList.length);

    // Get a random item from the selected list
    String randomItem = randomList[randomItemIndex];

    return randomItem;
  }

  getAddressByLatLong({required LatLng latLng}) async {
    emit(AddressLoadingState());
    List<List<String>> keys = await getDataFromDocuments();
    print("Random keys ${getRandomItemFromListOfLists(keys)}");
    UniversalData universalData = await addressApiRepository.getAddress(
      latLng: latLng,
      kind: kind,
      lang: lang,
      key: getRandomItemFromListOfLists(keys),
    );
    if (universalData.error.isEmpty) {
      emit(AddressSuccessState(address: universalData.data as String));
    } else {
      emit(AddressErrorState(errorText: "Bunday hudud aniqlanmadi!"));
    }
  }

  void updateKind(String newKind) {
    kind = newKind;
  }

  void updateLang(String newLang) {
    lang = newLang;
  }

  void updateMapType(MapType newMapType) {
    mapType = newMapType;
    emit(AddressLoadingState());
    emit(AddressInitial());
  }
}
