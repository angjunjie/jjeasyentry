import 'dart:html';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:easyentry/model/testscan.dart';

class DatabaseProvider {
  static const String TABLE_NAME = "location";
  static const String COLUMN_ID = "id";
  static const String COLUMN_NAME = "name";

  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();

  Database _database;

  Future<Database> get database async {
    print("database getter called");

    if (_database != null) {
      return _database;
    }

    _database = await createDatabase();

    return _database;
  }

  Future<Database> createDatabase() async {
    String dbPath = await getDatabasesPath();

    return await openDatabase(
      join(dbPath, 'locationDB.db'),
      version: 1,
      onCreate: (Database database, int version) async {
        print("Creating location table");

        await database.execute(
          "CREATE TABLE $TABLE_NAME ("
          "$COLUMN_ID INTEGER PRIMARY KEY,"
          "$COLUMN_NAME TEXT,"
          ")",
        );
      },
    );
  }

  Future<List<testScan>> getLocations() async {
    final db = await database;
    var locations =
        await db.query(TABLE_NAME, columns: [COLUMN_ID, COLUMN_NAME]);

    List<testScan> locationList = List<testScan>();

    locations.forEach((currentLocation) {
      testScan location = testScan.fromMap(currentLocation);
      locationList.add(location);
    });

    return locationList;
  } //FOREACH LOCATION ADD TO THE LIST

  Future<testScan> insert(testScan testScan) async {
    final db = await database;

    testScan.id = await db.insert(TABLE_NAME, testScan.toMap());
  } // "INSERT" METHOD
}
