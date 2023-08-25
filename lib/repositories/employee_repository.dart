import 'package:rti/model/employee.dart';
import 'package:rti/storage/database_helper.dart';
import 'package:sqflite/sqlite_api.dart';

class EmployeeRepository {
  Future<List<Employee>> getEmployees() async {
    final datas = await dbHelper.fetch(DatabaseHelper.employeeTable);
    print('datas');
    print(datas);
    List<Employee> todos = [];
    for (var item in datas) {
      if (item['deletedAt'] == null || item['deletedAt'] == '') {
        todos.add(Employee(
          id: item['id'] as int,
          name: item['name'] as String,
          role: item['role'] as String,
          startDate: item['startDate'] as String,
          endDate: item['endDate'] as String,
        ));
      }
    }
    return todos;
  }

  Future<dynamic> addEmployee(Employee employee) async {
    return await dbHelper.insert(
        DatabaseHelper.employeeTable, employee.toJson());
  }

  Future<dynamic> editEmployee(Employee employee) async {
    return await dbHelper.update(
        DatabaseHelper.employeeTable, employee.toMap());
  }

  Future<dynamic> removeEmployee({
    required Database database,
    required int id,
  }) async {
    return await database.transaction((txn) async {
      await txn.rawDelete('DELETE FROM todo where id = $id');
    });
  }
}
