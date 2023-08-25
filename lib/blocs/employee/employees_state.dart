part of 'employees_bloc.dart';

abstract class EmployeesState extends Equatable {
  const EmployeesState();

  @override
  List<Object> get props => [];
}

class EmployeesLoading extends EmployeesState {}

class EmployeesLoaded extends EmployeesState {
  final List<Employee> employees;

  const EmployeesLoaded({
    this.employees = const <Employee>[],
  });

  @override
  List<Object> get props => [employees];
}

class EmployeesError extends EmployeesState {}
