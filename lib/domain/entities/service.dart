import 'package:equatable/equatable.dart';

import '../enums/status.dart';

class ServiceEntity extends Equatable {
  final int id;
  final String serviceDescription;
  final int servicePrice;
  final Status available;
  final String serviceCategoryName;
  final String packageName;
  final String employeeName;

  ServiceEntity({
    required this.id,
    this.serviceDescription = "",
    required this.servicePrice,
    required this.available,
    this.serviceCategoryName = "",
    this.packageName = "",
    this.employeeName = "",
  });

  @override
  List<Object?> get props => [
        id,
        serviceDescription,
        servicePrice,
        available,
        serviceCategoryName,
        packageName,
        employeeName,
      ];

  factory ServiceEntity.fromJson(Map<String, dynamic> map) {
    return ServiceEntity(
      id: map['id'] as int,
      serviceDescription: map['serviceDescription'] as String,
      servicePrice: map['servicePrice'] as int,
      available: Status.fromString(map['available']),
      serviceCategoryName: map['serviceCategoryName'] as String,
      packageName: map['packageName'] as String,
      employeeName: map['employeeName'] as String,
    );
  }
}
