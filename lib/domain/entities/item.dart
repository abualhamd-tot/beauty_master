import 'package:equatable/equatable.dart';

import 'item_category.dart';

class ItemEntity extends Equatable {
  final int id;
  final String itemName;
  final String itemDescription;
  final int itemStock;
  final int itemPrice;
  final ItemCategoryEntity category;

  ItemEntity({
    required this.id,
    this.itemName = "",
    this.itemDescription = "",
    required this.itemStock,
    required this.itemPrice,
    required this.category,
  });

  @override
  List<Object?> get props => [
        id,
        itemName,
        itemDescription,
        itemStock,
        itemPrice,
        category,
      ];

  factory ItemEntity.fromJson(Map<String, dynamic> map) {
    return ItemEntity(
      id: map['id'] as int,
      itemName: map['itemName'] as String,
      itemDescription: map['itemDescription'] as String,
      itemStock: map['itemStock'] as int,
      itemPrice: map['itemPrice'] as int,
      category: ItemCategoryEntity.fromJson(map['category']),
    );
  }
}
