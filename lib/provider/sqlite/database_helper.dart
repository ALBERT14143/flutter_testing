import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_login_api/provider/sqlite/sql_employee.dart';
class DatabaseHelper{
  static const dbName = "testingApi.db";
  static const version = 1;

  DatabaseHelper._dbConst();
  static final DatabaseHelper instance = DatabaseHelper._dbConst();

  Future<Database> get database async => await initDatabase();

  initDatabase() async {
    return openDatabase(
      await _getDatabasePath(),
      version: version,
      onCreate: onCreate,
      onUpgrade: onUpgrade
    );
  }

  Future<void> onCreate(Database db, int version) async {
    final batch = db.batch();
    db.execute(SqlEmployee.createTableEmployee);
    await batch.commit();
  }
  Future<void> onUpgrade(Database db, int oldVersion, int newVersion) async {

  }

  Future<String> _getDatabasePath() async {
    String path = await getDatabasesPath();
    return join(path, dbName);
  }
}