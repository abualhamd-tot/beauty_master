import 'package:equatable/equatable.dart';

class RoomEntity extends Equatable {
  final int id;
  final int roomNumber;
  final bool availability;
  final String centerName;

  RoomEntity({
    required this.id,
    required this.roomNumber,
    required this.availability,
    this.centerName = "",
  });

  factory RoomEntity.fromJson(Map<String, dynamic> json) {
    return RoomEntity(
      id: json['id'] as int,
      roomNumber: json['roomNumber'] as int,
      availability: json['availability'] as bool,
      centerName: json['centerName'] as String,
    );
  }

  @override
  List<Object?> get props => [id, roomNumber, availability, centerName];
}
