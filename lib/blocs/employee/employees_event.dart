part of 'employees_bloc.dart';

abstract class EmployeeEvent extends Equatable {
  const EmployeeEvent();

  @override
  List<Object> get props => [];
}

class LoadEmployees extends EmployeeEvent {
  final List<Employee> employees;

  const LoadEmployees({
    this.employees = const <Employee>[],
  });

  @override
  List<Object> get props => [employees];
}

class AddEmployee extends EmployeeEvent {
  final Employee employee;

  const AddEmployee({
    required this.employee,
  });

  @override
  List<Object> get props => [employee];
}

class UpdateEmployee extends EmployeeEvent {
  final Employee employee;

  const UpdateEmployee({
    required this.employee,
  });

  @override
  List<Object> get props => [employee];
}

class DeleteEmployee extends EmployeeEvent {
  final Employee employee;

  const DeleteEmployee({
    required this.employee,
  });

  @override
  List<Object> get props => [employee];
}
