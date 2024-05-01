import 'package:equatable/equatable.dart';

import '../enums/status.dart';

class ComplaintEntity extends Equatable {
  final int id;
  final String complaintDate;
  final String complaintDescription;
  final String complaintCategory;
  final Status complaintStatus;
  final String assignedTo;
  final String? customerName;

  ComplaintEntity({
    required this.id,
    required this.complaintDate,
    this.complaintDescription = "",
    this.complaintCategory = "",
    required this.complaintStatus,
    this.assignedTo = "",
    this.customerName,
  });

  factory ComplaintEntity.fromJson(Map<String, dynamic> json) {
    return ComplaintEntity(
      id: json['id'] as int,
      complaintDate: json['complaintDate'] as String,
      complaintDescription: json['complaintDescription'] as String,
      complaintCategory: json['complaintCategory'] as String,
      complaintStatus: json['complaintStatus'] as Status,
      assignedTo: json['assignedTo'] as String,
      customerName: json['customerName'] as String?,
    );
  }

  @override
  List<Object?> get props => [
        id,
        complaintDate,
        complaintDescription,
        complaintCategory,
        complaintStatus,
        assignedTo,
        customerName
      ];
}
