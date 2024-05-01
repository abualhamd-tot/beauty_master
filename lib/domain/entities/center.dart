import 'package:equatable/equatable.dart';

import 'branch.dart';
import 'department.dart';
import 'room.dart';

class CenterEntity extends Equatable {
  final int id;
  final String centerName;
  final int openingHours;
  final String specialty;
  final List<BranchEntity> branches;
  final List<DepartmentEntity> departments;
  final List<RoomEntity> rooms;

  CenterEntity({
    required this.id,
    this.centerName = "",
    this.openingHours = 0,
    this.specialty = "",
    this.branches = const [],
    this.departments = const [],
    this.rooms = const [],
  });

  factory CenterEntity.fromJson(Map<String, dynamic> json) {
    return CenterEntity(
      id: json['id'] as int,
      centerName: json['centerName'] as String,
      openingHours: json['openingHours'] as int,
      specialty: json['specialty'],
      branches: (json['branches'] as List<dynamic>)
          .map((e) => BranchEntity.fromJson(e))
          .toList(),
      departments: (json['departments'] as List<dynamic>)
          .map((e) => DepartmentEntity.fromJson(e))
          .toList(),
      rooms: (json['rooms'] as List<dynamic>)
          .map((e) => RoomEntity.fromJson(e))
          .toList(),
    );
  }

  @override
  List<Object?> get props =>
      [id, centerName, openingHours, specialty, branches, departments, rooms];
}
