import 'package:equatable/equatable.dart';

import 'time_slot.dart';

class ManagerEntity extends Equatable {
  final String id;
  final String doctorEmail;
  final String doctorFirstName;
  final String doctorLastName;
  final String doctorPhoneNumber;
  final String userName;
  final String responsibilities;
  final String hiringDate;
  final int workingHours;
  final int experience;
  final String departmentName;
  final List<TimeSlotEntity> timeSlots;

  ManagerEntity({
    this.id = "",
    this.doctorEmail = "",
    this.doctorFirstName = "",
    this.doctorLastName = "",
    this.doctorPhoneNumber = "",
    this.userName = "",
    this.responsibilities = "",
    required this.hiringDate,
    required this.workingHours,
    required this.experience,
    this.departmentName = "",
    this.timeSlots = const [],
  });

  factory ManagerEntity.fromJson(Map<String, dynamic> json) {
    return ManagerEntity(
      id: json['id'] as String,
      doctorEmail: json['doctorEmail'] as String,
      doctorFirstName: json['doctorFirstName'] as String,
      doctorLastName: json['doctorLastName'] as String,
      doctorPhoneNumber: json['doctorPhoneNumber'] as String,
      userName: json['userName'] as String,
      responsibilities: json['responsibilities'] as String,
      hiringDate: json['hiringDate'] as String,
      workingHours: json['workingHours'] as int,
      experience: json['experience'] as int,
      departmentName: json['departmentName'] as String,
      timeSlots: (json['timeSlots'] as List<dynamic>)
          .map((e) => TimeSlotEntity.fromJson(e))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        doctorEmail,
        doctorFirstName,
        doctorLastName,
        doctorPhoneNumber,
        userName,
        responsibilities,
        hiringDate,
        workingHours,
        experience,
        departmentName,
        timeSlots
      ];
}
