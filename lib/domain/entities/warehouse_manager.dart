import 'package:equatable/equatable.dart';

class WareHouseManagerEntity extends Equatable {
  final int id;
  final String wareHouseManagerEmail;
  final String wareHouseManagerFirstName;
  final String wareHouseManagerLastName;
  final String wareHouseManagerPhoneNumber;
  final String userName;
  final String positionTitle;
  final DateTime startDate;
  final DateTime endDate;
  final String inventoryName;

  WareHouseManagerEntity({
    required this.id,
    this.wareHouseManagerEmail = "",
    this.wareHouseManagerFirstName = "",
    this.wareHouseManagerLastName = "",
    this.wareHouseManagerPhoneNumber = "",
    this.userName = "",
    this.positionTitle = "",
    required this.startDate,
    required this.endDate,
    this.inventoryName = "",
  });

  @override
  List<Object?> get props => [
        id,
        wareHouseManagerEmail,
        wareHouseManagerFirstName,
        wareHouseManagerLastName,
        wareHouseManagerPhoneNumber,
        userName,
        positionTitle,
        startDate,
        endDate,
        inventoryName,
      ];

  factory WareHouseManagerEntity.fromJson(Map<String, dynamic> map) {
    return WareHouseManagerEntity(
      id: map['id'] as int,
      wareHouseManagerEmail: map['wareHouseManagerEmail'] as String,
      wareHouseManagerFirstName: map['wareHouseManagerFirstName'] as String,
      wareHouseManagerLastName: map['wareHouseManagerLastName'] as String,
      wareHouseManagerPhoneNumber: map['wareHouseManagerPhoneNumber'] as String,
      userName: map['userName'] as String,
      positionTitle: map['positionTitle'] as String,
      startDate: DateTime.parse(map['startDate'] as String),
      endDate: DateTime.parse(map['endDate'] as String),
      inventoryName: map['inventoryName'] as String,
    );
  }
}
