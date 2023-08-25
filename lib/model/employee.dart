import 'package:equatable/equatable.dart';

class Employee extends Equatable {
  final int id;
  final String name;
  final String role;
  final String startDate;
  final String endDate;
  final String? deletedAt;

  const Employee({
    required this.id,
    required this.name,
    required this.role,
    required this.startDate,
    required this.endDate,
    this.deletedAt,
  });

  Employee copyWith({
    int? id,
    String? name,
    String? role,
    String? startDate,
    String? endDate,
    String? deletedAt,
  }) {
    return Employee(
      id: id ?? this.id,
      name: name ?? this.name,
      role: role ?? this.role,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      deletedAt: deletedAt ?? '',
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        role,
        startDate,
        endDate,
      ];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'role': role,
      'startDate': startDate,
      'endDate': endDate
    };
  }

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      'id': id,
      'name': name,
      'role': role,
      'startDate': startDate,
      'endDate': endDate,
      'deletedAt': deletedAt
    };
    return map;
  }
}
