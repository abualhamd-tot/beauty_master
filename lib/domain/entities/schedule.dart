import 'package:equatable/equatable.dart';

class ScheduleEntity extends Equatable {
  final int id;
  final String? employeeName;
  final int? timeSlotId;
  final int? appointmentId;

  ScheduleEntity({
    required this.id,
    this.employeeName,
    this.timeSlotId,
    this.appointmentId,
  });

  factory ScheduleEntity.fromJson(Map<String, dynamic> json) {
    return ScheduleEntity(
      id: json['id'] as int,
      employeeName: json['employeeName'] as String?,
      timeSlotId: json['timeSlotId'] as int?,
      appointmentId: json['appointmentId'] as int?,
    );
  }

  @override
  List<Object?> get props => [id, employeeName, timeSlotId, appointmentId];
}
