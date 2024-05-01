import 'package:equatable/equatable.dart';

import 'employee.dart';

class DepartmentEntity extends Equatable {
  final int id;
  final String departmentName;
  final String centerName;
  final List<EmployeeEntity> employees;

  DepartmentEntity({
    required this.id,
    this.departmentName = "",
    this.centerName = "",
    this.employees = const [],
  });

  factory DepartmentEntity.fromJson(Map<String, dynamic> json) {
    return DepartmentEntity(
      id: json['id'] as int,
      departmentName: json['departmentName'] as String,
      centerName: json['centerName'] as String,
      employees: (json['employees'] as List<dynamic>)
          .map((e) => EmployeeEntity.fromJson(e))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [id, departmentName, centerName, employees];
}
