import 'package:test_login_api/model/employee.dart';
import 'package:test_login_api/provider/sqlite/database_helper.dart';

class SqlEmployee{
  static const tEmployee = "tEmployee";
  static const colId = "Id";
  static const colFirstName = "FistName";
  static const colLastName = "LastName";
  static const colMiddleName = "MiddleName";
  static const colPhoneNumber = "PhoneNumber";

  static const createTableEmployee = '''
    CREATE TABLE IF NOT EXISTS $tEmployee(
      $colId INTEGER PRIMARY KEY,
      $colFirstName VARCHAR(20),
      $colLastName VARCHAR(20),
      $colMiddleName VARCHAR(20),
      $colPhoneNumber VARCHAR(15)
    )
  ''';

  Future<int> insertEmployee({required Employee employee}) async {
    final db = await DatabaseHelper.instance.database;
    return await db.insert(tEmployee, employee.toMap());
  }

  Future<List<Employee>> getEmployees() async {
    final db = await DatabaseHelper.instance.database;
    var raw = await db.query(tEmployee);
    return raw.map((e) => Employee.fromMap(e)).toList();
  }
}