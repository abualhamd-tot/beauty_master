import 'package:equatable/equatable.dart';

import 'service.dart';

class ServiceCategoryEntity extends Equatable {
  final int id;
  final String serviceCategoryName;
  final String serviceCategoryDescription;
  final List<ServiceEntity> services;

  ServiceCategoryEntity({
    required this.id,
    this.serviceCategoryName = "",
    this.serviceCategoryDescription = "",
    this.services = const [],
  });

  factory ServiceCategoryEntity.fromJson(Map<String, dynamic> json) {
    return ServiceCategoryEntity(
      id: json['id'] as int,
      serviceCategoryName: json['serviceCategoryName'] as String,
      serviceCategoryDescription: json['serviceCategoryDescription'] as String,
      services: (json['services'] as List<dynamic>)
          .map((e) => ServiceEntity.fromJson(e))
          .toList(),
    );
  }

  @override
  List<Object?> get props =>
      [id, serviceCategoryName, serviceCategoryDescription, services];
}
