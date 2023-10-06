import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app/services/api_service.dart';

import '../models/universal_data.dart';

class AddressApiRepository{
  final ApiService apiService;
  AddressApiRepository({required this.apiService});
  Future<UniversalData> getAddress({
    required LatLng latLng,
    required String kind,
    required String lang,
    required String key,
  }) async => apiService.getAddress(latLng: latLng, kind: kind, lang: lang, key: key);
}