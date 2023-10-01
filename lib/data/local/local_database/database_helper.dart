import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:taxi_app/data/models/notification_model/notification_model.dart';

class DBHelper {
  static Database? _database;
  static final DBHelper instance = DBHelper._privateConstructor();

  DBHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'taxi_app.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notifications(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        body TEXT,
        iconCode TEXT,
        timestamp INTEGER
      )
    ''');
  }

  Future<int> insertNotification(NotificationModel notification) async {
    final db = await database;
    int id = await db.insert('notifications', notification.toJson());
    debugPrint("ADDED NOTIFICATION ID:$id");
    return id;
  }

  Future<List<NotificationModel>> getAllNotifications() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('notifications');
    return List.generate(maps.length, (i) {
      return NotificationModel.fromJson(maps[i]);
    });
  }
}
