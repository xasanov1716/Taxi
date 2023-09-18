import 'package:taxi_app/data/local/search_location/search_history_db.dart';
import 'package:taxi_app/data/models/universal_data.dart';

class SearchHistoryRepository {
  final SearchHistoryDatabase _searchHistoryDatabase;

  SearchHistoryRepository(this._searchHistoryDatabase);

  Future<UniversalData> insertSearchQuery(String query) async {
    try {
      await _searchHistoryDatabase.insertSearchQuery(query);
      return UniversalData(data: 'Search query inserted successfully');
    } catch (e) {
      print('Failed to insert search query: $e');
      return UniversalData(error: 'Failed to insert search query: $e');
    }
  }

  Future<UniversalData> getRecentSearches(int limit) async {
    try {
      final recentSearches =
          await _searchHistoryDatabase.getRecentSearches(limit);
      return UniversalData(data: recentSearches);
    } catch (e) {
      print('Failed to get recent searches: $e');
      return UniversalData(error: 'Failed to get recent searches: $e');
    }
  }

  Future<UniversalData> clearSearchHistory() async {
    try {
      await _searchHistoryDatabase.clearSearchHistory();
      return UniversalData(data: 'Search history cleared successfully');
    } catch (e) {
      print('Failed to clear search history: $e');
      return UniversalData(error: 'Failed to clear search history: $e');
    }
  }
}
