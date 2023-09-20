import 'package:taxi_app/data/local/search_location/places_db.dart';
import 'package:taxi_app/data/models/universal_data.dart';

class PlacesDatabaseRepository {
  final PlacesDatabase _localDatabase;

  PlacesDatabaseRepository(this._localDatabase);

  Future<UniversalData> searchRegionsByName(String query) async {
    try {
      final regions = await _localDatabase.searchRegionsByName(query);
      return UniversalData(data: regions);
    } catch (e) {
      return UniversalData(error: 'Failed to get regions: $e');
    }
  }

  Future<UniversalData> searchDistrictsByName(String query) async {
    try {
      final districts = await _localDatabase.searchDistrictsByName(query);
      return UniversalData(data: districts);
    } catch (e) {
      return UniversalData(
        error: 'Failed to get districts: $e',
      );
    }
  }

  Future<UniversalData> searchQuartersByName(String query) async {
    try {
      final quarters = await _localDatabase.searchQuartersByName(query);
      return UniversalData(data: quarters);
    } catch (e) {
      return UniversalData(error: 'Failed to get quarters: $e');
    }
  }
}
