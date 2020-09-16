import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:easyentry/model/location.dart';

class DbHelper {
  static Future<Database> get database async {
    return openDatabase(
      join(await getDatabasesPath(), 'location.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE locations(id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR(50))", //PRIMARY KEY SUPPOSEDLY ID
        );
      },
      //onUpgrade: (db, oldVersion, newVersion) {
      //return db.execute("ALTER TABLE locations CHANGE id id INTEGER AUTO_INCREMENT PRIMARY KEY");
      //},
      version: 1,
    );
  }

  static Future<void> insertLocation(Location location) async {
    final Database db = await database;

    await db.insert(
      'locations',
      location.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,

      // NOW I WANT TO DO UNIQUE LOCATION SO HOW DO I DO IT????????????????? ? ? ??
    );
  }

  static Future<List<Location>> retrieveLocations() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('locations');
    final jackhammer = List.generate(maps.length, (i) {
      return Location(id: maps[i]['id'], title: maps[i]['title']);
    });
    return jackhammer;

    /*    return List.generate(maps.length, (i) {
      return Location(
        id: maps[i]['id'],
        title: maps[i]['title'],
      );
    }); */
  }

  static Future<void> deleteLocation(Location location) async {
    final db = await database;
    await db.delete(
      'locations',
      where: "id = ?",
      whereArgs: [location.id],
    );
  }
}
