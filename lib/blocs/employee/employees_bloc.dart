import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rti/model/employee.dart';
import 'package:rti/repositories/employee_repository.dart';

part 'employees_event.dart';
part 'employees_state.dart';

class EmployeesBloc extends Bloc<EmployeeEvent, EmployeesState> {
  EmployeesBloc() : super(EmployeesLoading()) {
    on<LoadEmployees>(_onLoadEmployees);
    on<AddEmployee>(_onAddEmployee);
    on<DeleteEmployee>(_onDeleteEmployee);
    on<UpdateEmployee>(_onUpdateEmployee);
  }

  void _onLoadEmployees(
    LoadEmployees event,
    Emitter<EmployeesState> emit,
  ) {
    emit(EmployeesLoaded(employees: event.employees));
  }

  void _onAddEmployee(
    AddEmployee event,
    Emitter<EmployeesState> emit,
  ) {
    final state = this.state;
    if (state is EmployeesLoaded) {
      emit(
        EmployeesLoaded(
          employees: List.from(state.employees)..add(event.employee),
        ),
      );
    }
  }

  void _onDeleteEmployee(
    DeleteEmployee event,
    Emitter<EmployeesState> emit,
  ) {
    final state = this.state;
    if (state is EmployeesLoaded) {
      List<Employee> employees = (state.employees.where((employee) {
        return employee.id != event.employee.id;
      })).toList();

      emit(EmployeesLoaded(employees: employees));
    }
  }

  void _onUpdateEmployee(
    UpdateEmployee event,
    Emitter<EmployeesState> emit,
  ) {
    final state = this.state;
    if (state is EmployeesLoaded) {
      List<Employee> employees = (state.employees.map((employee) {
        return employee.id == event.employee.id ? event.employee : employee;
      })).toList();

      emit(EmployeesLoaded(employees: employees));
    }
  }

  Future<void> getEmployees() async {
    try {
      final employees = await EmployeeRepository().getEmployees();
      emit(EmployeesLoaded(employees: employees));
    } catch (e) {
      emit(EmployeesError());
    }
  }

  Future<void> addEmployee(Employee employee) async {
    try {
      await EmployeeRepository().addEmployee(employee);
      getEmployees();
    } catch (e) {
      emit(EmployeesError());
    }
  }

  Future<void> editEmployee(Employee employee) async {
    try {
      await EmployeeRepository().editEmployee(employee);
      getEmployees();
    } catch (e) {
      emit(EmployeesError());
    }
  }

  Future<void> deleteEmployee(Employee employee) async {
    try {
      await EmployeeRepository().editEmployee(employee);
      getEmployees();
    } catch (e) {
      emit(EmployeesError());
    }
  }
}
