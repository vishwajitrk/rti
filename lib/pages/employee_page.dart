import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rti/blocs/employee/employees_bloc.dart';
import 'package:rti/config/theme.dart';
import 'package:rti/constants/navigation_routes.dart';
import 'package:rti/model/employee.dart';
import 'package:rti/utils/app_utils.dart';
import 'package:rti/widgets/app_bar.dart';

class EmployeePage extends StatelessWidget {
  const EmployeePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(title: 'Employee List'),
        centerTitle: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routing.addEmployee);
        },
        backgroundColor: AppColors.themePrimary,
        splashColor: Colors.grey,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
        ),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: BlocBuilder<EmployeesBloc, EmployeesState>(
        builder: (context, state) {
          if (state is EmployeesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is EmployeesLoaded) {
            if (state.employees.isEmpty) {
              return Container(
                  decoration: const BoxDecoration(color: AppColors.background),
                  padding: const EdgeInsets.only(top: 150.0),
                  child: const Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage("assets/images/no-result.png"),
                            height: 280,
                          ),
                        ]),
                  ));
            }
            List<Employee> currentEmployees = state.employees
                .where((employee) => employee.endDate == '')
                .toList();
            List<Employee> previousEmployees = state.employees
                .where((employee) => employee.endDate != '')
                .toList();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - 160,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (currentEmployees.isNotEmpty)
                          _employee(currentEmployees, 'Current'),
                        if (previousEmployees.isNotEmpty)
                          _employee(previousEmployees, 'Previous'),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: const Text(
                    'Swipe left to delete',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            );
          } else {
            return const Text('Something went wrong.');
          }
        },
      ),
    );
  }

  Column _employee(List<Employee> employees, String status) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: const BoxDecoration(color: AppColors.background),
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            child: Row(
              children: [
                Text(
                  '$status employees',
                  style: const TextStyle(
                      fontSize: 20,
                      color: AppColors.themePrimary,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: employees.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            final employee = employees[index];
            return Card(
                margin: const EdgeInsets.only(bottom: 1.0),
                child: Dismissible(
                    direction: DismissDirection.endToStart,
                    key: Key(employee.name),
                    onDismissed: (direction) {
                      employees.removeAt(index);
                      context
                          .read<EmployeesBloc>()
                          .deleteEmployee(employee.copyWith(
                            deletedAt: DateTime.now().toString(),
                          ));
                      final snackBar = SnackBar(
                        content: const Text('Employee data has been deleted'),
                        action: SnackBarAction(
                          label: 'Undo',
                          textColor: AppColors.themePrimary,
                          onPressed: () async {
                            Navigator.pushNamed(context, Routing.editEmployee,
                                arguments: employee);
                          },
                        ),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    background: const ColoredBox(
                      color: AppColors.red,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child:
                              Icon(Icons.delete_outline, color: Colors.white),
                        ),
                      ),
                    ),
                    child: _employeeCard(
                      context,
                      employees[index],
                    )));
          },
        ),
      ],
    );
  }

  Widget _employeeCard(
    BuildContext context,
    Employee employee,
  ) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, Routing.editEmployee,
                arguments: employee),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      employee.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        employee.role,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                    Text(
                      employee.endDate != null && employee.endDate != ''
                          ? '${AppUtils.ddMMMYYYY(employee.startDate)} - ${AppUtils.ddMMMYYYY(employee.endDate)}'
                          : 'From ${AppUtils.ddMMMYYYY(employee.startDate)}',
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
