// ignore: depend_on_referenced_packages

import 'package:flutter/services.dart';
import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';
import 'package:taxi_app/data/models/places/district_model.dart';
import 'package:taxi_app/data/models/places/quarter_model.dart';
import 'package:taxi_app/data/models/places/region_model.dart';

class PlacesDatabase {
  static final PlacesDatabase instance = PlacesDatabase._init();

  PlacesDatabase._init();

  factory PlacesDatabase() {
    return instance;
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await createAndInitializeDatabase();
      return _database!;
    }
  }

  Future<Database> createAndInitializeDatabase() async {
    final databasePath = await getDatabasesPath();
    final databaseFilePath = join(databasePath, 'my_database.db');

    final database = await openDatabase(databaseFilePath, version: 1,
        onCreate: (Database db, int version) async {
          // Read and execute SQL script here
          final scriptContent = await rootBundle.loadString('assets/places/regions.sql');
          final statements = scriptContent.split(';');

          for (final statement in statements) {
            if (statement.trim().isNotEmpty) {
              await db.execute(statement);
            }
          }
        });

    return database; // Return the created database
  }




  // initDb() async {
  //   const dbPath = "assets/places/regions.sql";
  //
  //   var databasesPath = await getDatabasesPath();
  //   var path = join(databasesPath, dbPath);
  //   var exists = await databaseExists(path);
  //   if (!exists) {
  //     // Should happen only the first time you launch your application
  //     print("Creating new copy from asset");
  //
  //     // Make sure the parent directory exists
  //     try {
  //       await Directory(dirname(path)).create(recursive: true);
  //     } catch (_) {}
  //
  //     // Copy from asset
  //     ByteData data = await rootBundle.load(dbPath);
  //     List<int> bytes =
  //     data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  //
  //     // Write and flush the bytes written
  //     await File(path).writeAsBytes(bytes, flush: true);
  //   } else {
  //     print("Opening existing database");
  //   }
  //   return await openDatabase(path);
  // }
  // Future _initDatabase() async {
  //   final dbPath = await getDatabasesPath();
  //   final path = join(dbPath, "regions.db");
  //   print(path);
  //
  //   final exists = await databaseExists(path);
  //   if (!exists) {
  //     try {
  //       await Directory(dirname(path)).create(recursive: true);
  //     } catch (_) {}
  //     ByteData data = await rootBundle.load("assets/places/regions.db");
  //     List<int> bytes =
  //     data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  //     await File(path).writeAsBytes(bytes, flush: true);
  //     print("db created");
  //   }
  //
  //   final database = await openDatabase(path);
  //   print(database);
  //   return database;
  // }

  // Future<Database> _initDB() async {
  //   final documentsDirectory = await getApplicationDocumentsDirectory();
  //   final path = join(documentsDirectory.path, "regions.db");
  //
  //   if (!await databaseExists(path)) {
  //     final byteData = await rootBundle.load("assets/places/regions.sql");
  //     final content = utf8.decode(byteData.buffer.asUint8List());
  //
  //     final database =
  //         await openDatabase(path, version: 1, onCreate: (db, version) async {
  //       await db.execute(content);
  //     });
  //
  //     return database;
  //   } else {
  //     return await openDatabase(path);
  //   }
  // }

  Future<List<Map<String, dynamic>>> executeQuery(String query) async {
    final db = await instance.database;
    return await db.rawQuery(query);
  }

  Future<List<RegionModel>> searchRegionsByName(String query) async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'regions',
      where: 'name LIKE ?',
      whereArgs: ['%$query%'],
    );
    return maps.map((e) => RegionModel.fromJson(e)).toList();
  }

  Future<List<DistrictModel>> searchDistrictsByName(String query) async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'districts',
      where: 'name LIKE ?',
      whereArgs: ['%$query%'],
    );
    return maps.map((e) => DistrictModel.fromJson(e)).toList();
  }

  Future<List<QuarterModel>> searchQuartersByName(String query) async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'quarters',
      where: 'name LIKE ?',
      whereArgs: ['%$query%'],
    );
    return maps.map((e) => QuarterModel.fromJson(e)).toList();
  }

  // Future<List<RegionModel>> getAllRegions() async {
  //   List<RegionModel> allRegions = [];
  //   final db = await instance.database;
  //   allRegions = (await db.query('regions'))
  //       .map((e) => RegionModel.fromJson(e))
  //       .toList();
  //
  //   return allRegions;
  // }
  //
  // Future<List<DistrictModel>> getAllDistricts() async {
  //   List<DistrictModel> allDistricts = [];
  //   final db = await instance.database;
  //   allDistricts = (await db.query('districts'))
  //       .map((e) => DistrictModel.fromJson(e))
  //       .toList();
  //
  //   return allDistricts;
  // }
  //
  // Future<List<QuarterModel>> getAllQuarters() async {
  //   List<QuarterModel> allQuarters = [];
  //   final db = await instance.database;
  //   allQuarters = (await db.query('quarters'))
  //       .map((e) => QuarterModel.fromJson(e))
  //       .toList();
  //
  //   return allQuarters;
  // }
}
