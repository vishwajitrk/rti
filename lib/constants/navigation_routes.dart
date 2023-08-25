import 'package:flutter/material.dart';
import 'package:rti/model/employee.dart';
import 'package:rti/pages/add_edit_employee_page.dart';
import 'package:rti/pages/employee_page.dart';

class Routing {
  static const String landing = '/';
  static const String employee = '/employee';
  static const String addEmployee = 'add-employee';
  static const String editEmployee = 'edit-employee';
}

Route<dynamic> generateRoute(RouteSettings settings) {
  final arguments = settings.arguments;
  switch (settings.name) {
    case Routing.landing:
      return MaterialPageRoute(builder: (_) => const EmployeePage());
    case Routing.employee:
      return MaterialPageRoute(builder: (_) => const EmployeePage());
    case Routing.addEmployee:
      return MaterialPageRoute(builder: (_) => const AddEditEmployeePage());
    case Routing.editEmployee:
      return MaterialPageRoute(
          builder: (_) => AddEditEmployeePage(employee: arguments as Employee));

    default:
      return MaterialPageRoute(builder: (_) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => Navigator.pop(_),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_back_ios, color: Colors.black, size: 14),
                      Text('Go back'),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text('No route defined for ${settings.name}'),
              ],
            ),
          ),
        );
      });
  }
}
