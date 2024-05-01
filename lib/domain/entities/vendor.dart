import 'package:equatable/equatable.dart';

class VendorEntity extends Equatable {
  final int id;
  final String vendorName;
  final String vendorType;
  final String contactPerson;
  final String contractStartDate;
  final String contractEndDate;
  final String centerName;

  VendorEntity({
    required this.id,
    this.vendorName = "",
    this.vendorType = "",
    this.contactPerson = "",
    required this.contractStartDate,
    required this.contractEndDate,
    this.centerName = "",
  });

  @override
  List<Object?> get props => [
        id,
        vendorName,
        vendorType,
        contactPerson,
        contractStartDate,
        contractEndDate,
        centerName,
      ];

  factory VendorEntity.fromJson(Map<String, dynamic> map) {
    return VendorEntity(
      id: map['id'] as int,
      vendorName: map['vendorName'] as String,
      vendorType: map['vendorType'] as String,
      contactPerson: map['contactPerson'] as String,
      contractStartDate: map['contractStartDate'] as String,
      contractEndDate: map['contractEndDate'] as String,
      centerName: map['centerName'] as String,
    );
  }
}
