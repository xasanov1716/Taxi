import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:taxi_app/data/models/search_history/search_history_model.dart';

class SearchHistoryDatabase {
  static final SearchHistoryDatabase instance = SearchHistoryDatabase._init();

  SearchHistoryDatabase._init();

  factory SearchHistoryDatabase() {
    return instance;
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initializeDatabase();
      return _database!;
    }
  }

  Future<Database> _initializeDatabase() async {
    final path = join(await getDatabasesPath(), 'search_history.db');
    _database = await openDatabase(path, version: 1, onCreate: _createDatabase);
    return _database!;
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE search_history (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        query TEXT,
        timestamp INTEGER
      )
    ''');
  }

  Future<void> insertSearchQuery(String query) async {
    final db = await database;
    await db.insert(
      'search_history',
      {'query': query, 'timestamp': DateTime.now().millisecondsSinceEpoch},
    );
  }

  Future<List<SearchHistoryModel>> getRecentSearches(int limit) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'search_history',
      orderBy: 'timestamp DESC',
      limit: limit,
    );

    // Create a list of SearchHistoryModel instances from the query results.
    List<SearchHistoryModel> history = maps.map((map) {
      return SearchHistoryModel(
        id: map['id'] as int,
        query: map['query'] as String,
        timestamp: map['timestamp'] as int,
      );
    }).toList();

    return history;
  }

  Future<void> clearSearchHistory() async {
    final db = await database;
    await db.delete('search_history');
  }
}
