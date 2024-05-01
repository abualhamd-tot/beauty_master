import 'package:equatable/equatable.dart';

class BranchEntity extends Equatable {
  final int id;
  final String branchName;
  final String city;
  final String country;
  final String postalCode;
  final String branchPhoneNumber;
  final String emailAddress;
  final String centerName;

  BranchEntity({
    required this.id,
    this.branchName = "",
    this.city = "",
    this.country = "",
    this.postalCode = "",
    this.branchPhoneNumber = "",
    this.emailAddress = "",
    this.centerName = "",
  });

  factory BranchEntity.fromJson(Map<String, dynamic> json) {
    return BranchEntity(
      id: json['id'] as int,
      branchName: json['branchName'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      postalCode: json['postalCode'] as String,
      branchPhoneNumber: json['branchPhoneNumber'] as String,
      emailAddress: json['emailAddress'] as String,
      centerName: json['centerName'] as String,
    );
  }

  @override
  List<Object?> get props => [
        id,
        branchName,
        city,
        country,
        postalCode,
        branchPhoneNumber,
        emailAddress,
        centerName,
      ];
}
