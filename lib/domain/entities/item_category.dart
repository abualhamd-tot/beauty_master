import 'package:equatable/equatable.dart';

class ItemCategoryEntity extends Equatable {
  final int id;
  final String categoryName;
  final int referenceNumber;
  final String inventoryName;

  ItemCategoryEntity({
    required this.id,
    this.categoryName = "",
    required this.referenceNumber,
    this.inventoryName = "",
  });

  factory ItemCategoryEntity.fromJson(Map<String, dynamic> json) {
    return ItemCategoryEntity(
      id: json['id'] as int,
      categoryName: json['categoryName'] as String,
      referenceNumber: json['referenceNumber'] as int,
      inventoryName: json['inventoryName'] as String,
    );
  }

  @override
  List<Object?> get props => [id, categoryName, referenceNumber, inventoryName];
}
