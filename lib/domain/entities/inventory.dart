import 'package:beauty_master/domain/entities/item_category.dart';
import 'package:equatable/equatable.dart';

class InventoryEntity extends Equatable {
  final int id;
  final String inventoryName;
  final String inventoryLocation;
  final int inventoryCapacity;
  final List<ItemCategoryEntity> itemCategories;

  InventoryEntity({
    required this.id,
    this.inventoryName = "",
    this.inventoryLocation = "",
    required this.inventoryCapacity,
    this.itemCategories = const [],
  });

  factory InventoryEntity.fromJson(Map<String, dynamic> json) {
    return InventoryEntity(
      id: json['id'] as int,
      inventoryName: json['inventoryName'] as String,
      inventoryLocation: json['inventoryLocation'] as String,
      inventoryCapacity: json['inventoryCapacity'] as int,
      itemCategories: (json['itemCategories'] as List<dynamic>)
          .map((e) => ItemCategoryEntity.fromJson(e))
          .toList(),
    );
  }

  @override
  List<Object?> get props =>
      [id, inventoryName, inventoryLocation, inventoryCapacity, itemCategories];
}
