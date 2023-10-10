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

  Future<List<Map<String, dynamic>>> executeQuery(String query) async {
    final db = await instance.database;
    return db.rawQuery(query);
  }

  Future<List<RegionModel>> searchRegionsByName(String query) async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'regions',
      where: 'name LIKE ?',
      whereArgs: ['%$query%'],
    );
    return maps.map(RegionModel.fromJson).toList();
  }

  Future<List<DistrictModel>> searchDistrictsByName(String query) async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'districts',
      where: 'name LIKE ?',
      whereArgs: ['%$query%'],
    );
    return maps.map(DistrictModel.fromJson).toList();
  }

  Future<List<QuarterModel>> searchQuartersByName(String query) async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'quarters',
      where: 'name LIKE ?',
      whereArgs: ['%$query%'],
    );
    return maps.map(QuarterModel.fromJson).toList();
  }

  Future<List<DistrictModel>> getDistrictById({required int id}) async {
    final db = await instance.database;
    List<DistrictModel> districtsById =
        (await db.query('districts', where: 'region_id LIKE ?', whereArgs: ['%$id']))
            .map(DistrictModel.fromJson)
            .toList();
    return districtsById;
  }

  Future<List<QuarterModel>> getQuarterById({required int id}) async {
    final db = await instance.database;
    List<QuarterModel> quarterById =
        (await db.query('quarters', where: 'district_id LIKE ?', whereArgs: ['%$id']))
            .map(QuarterModel.fromJson)
            .toList();

    return quarterById;
  }

  Future<List<RegionModel>> getAllRegions() async {
    final db = await instance.database;
    List<RegionModel> allRegions = (await db.query('regions')).map(RegionModel.fromJson).toList();

    return allRegions;
  }

  Future<List<RegionModel>> getRegionById({required int id}) async {
    final db = await instance.database;
    List<RegionModel> regionsById =
        (await db.query('regions', where: 'id LIKE ?', whereArgs: ['%$id']))
            .map(RegionModel.fromJson)
            .toList();
    return regionsById;
  }

  Future<List<DistrictModel>> getAllDistricts() async {
    final db = await instance.database;
    List<DistrictModel> allDistricts =
        (await db.query('districts')).map(DistrictModel.fromJson).toList();

    return allDistricts;
  }

  Future<List<QuarterModel>> getAllQuarters() async {
    final db = await instance.database;
    List<QuarterModel> allQuarters =
        (await db.query('quarters')).map(QuarterModel.fromJson).toList();

    return allQuarters;
  }
}
