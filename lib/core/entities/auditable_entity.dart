import 'base_entity.dart';

class AuditableEntity extends BaseEntity {
  final String createdBy;
  final String modifiedBy;
  final DateTime createdDate;
  final DateTime updatedDate;

  AuditableEntity({
    required super.id,
    this.createdBy = "",
    this.modifiedBy = "",
    required this.createdDate,
    required this.updatedDate,
  });

  factory AuditableEntity.fromJson(Map<String, dynamic> json) {
    return AuditableEntity(
      id: json['id'],
      createdBy: json['createdBy'],
      modifiedBy: json['modifiedBy'],
      createdDate: DateTime.parse(json['createdDate']),
      updatedDate: DateTime.parse(json['updatedDate']),
    );
  }

  @override
  List<Object?> get props =>
      [id, createdBy, modifiedBy, createdDate, updatedDate];
}
