import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

final dbHelper = DatabaseHelper();

class DatabaseHelper {
  static const _databaseName = "rti.db";
  static const _databaseVersion = 1;

  static const employeeTable = 'employees';

  static const columnId = 'id';
  static const employeeName = 'name';
  static const employeeRole = 'role';
  static const employeeStartDate = 'startDate';
  static const employeeEndDate = 'endDate';
  static const columnDeletedAt = 'deletedAt';

  late Database _db;

  // this opens the database (and creates it if it doesn't exist)
  Future<void> init() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    _db = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $employeeTable (
            $columnId INTEGER PRIMARY KEY,
            $employeeName TEXT NOT NULL,
            $employeeRole TEXT NOT NULL,
            $employeeStartDate DATETIME NULL,
            $employeeEndDate DATETIME NULL,
            $columnDeletedAt DATETIME NULL
          )
          ''');
  }

  Future<dynamic> fetch(String table) async {
    try {
      var result = await _db.rawQuery('SELECT * FROM $table');
      return result;
    } catch (ex) {
      return null;
    }
  }

  Future<int> insert(String table, body) async {
    return await _db.insert(table, body);
  }

  Future<int> update(String table, Map<String, dynamic> data) async {
    int id = data[columnId];
    return await _db.update(
      table,
      data,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future<int> delete(String table, int id) async {
    return await _db.delete(
      table,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}
