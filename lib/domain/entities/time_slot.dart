import 'package:equatable/equatable.dart';

class TimeSlotEntity extends Equatable {
  final int id;
  final String startTime;
  final String endTime;
  final String day;

  TimeSlotEntity({
    required this.id,
    required this.startTime,
    required this.endTime,
    this.day = "",
  });

  factory TimeSlotEntity.fromJson(Map<String, dynamic> json) {
    return TimeSlotEntity(
      id: json['id'] as int,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      day: json['day'] as String,
    );
  }

  @override
  List<Object?> get props => [id, startTime, endTime, day];
}
