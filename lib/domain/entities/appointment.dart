import 'package:equatable/equatable.dart';

class AppointmentEntity extends Equatable {
  final int id;
  final String startTime;
  final String endTime;
  final String date;
  final String customerName;
  final String employeeName;

  AppointmentEntity({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.date,
    this.customerName = "",
    this.employeeName = "",
  });

  factory AppointmentEntity.fromJson(Map<String, dynamic> json) {
    return AppointmentEntity(
      id: json['id'] as int,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      date: json['date'] as String,
      customerName: json['customerName'] as String,
      employeeName: json['employeeName'] as String,
    );
  }

  @override
  List<Object?> get props =>
      [id, startTime, endTime, date, customerName, employeeName];
}
