import 'package:equatable/equatable.dart';

import 'department.dart';
import 'service.dart';

class EmployeeEntity extends Equatable {
  final String id;
  final String employeeEmail;
  final String employeeFirstName;
  final String employeeLastName;
  final String employeePhoneNumber;
  final String userName;
  final DepartmentEntity department;
  final List<ServiceEntity> services;

  EmployeeEntity({
    this.id = "",
    this.employeeEmail = "",
    this.employeeFirstName = "",
    this.employeeLastName = "",
    this.employeePhoneNumber = "",
    this.userName = "",
    required this.department,
    this.services = const [],
  });

  factory EmployeeEntity.fromJson(Map<String, dynamic> json) {
    return EmployeeEntity(
      id: json['id'] as String,
      employeeEmail: json['employeeEmail'] as String,
      employeeFirstName: json['employeeFirstName'] as String,
      employeeLastName: json['employeeLastName'] as String,
      employeePhoneNumber: json['employeePhoneNumber'] as String,
      userName: json['userName'] as String,
      department: DepartmentEntity.fromJson(json['department']),
      services: (json['services'] as List<dynamic>)
          .map((e) => ServiceEntity.fromJson(e))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        employeeEmail,
        employeeFirstName,
        employeeLastName,
        employeePhoneNumber,
        userName,
        department,
        services
      ];
}
