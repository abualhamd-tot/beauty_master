import 'package:equatable/equatable.dart';

import 'item.dart';

class ItemOrderEntity extends Equatable {
  final int id;
  final int quantity;
  final ItemEntity item;

  ItemOrderEntity({
    required this.id,
    required this.quantity,
    required this.item,
  });

  factory ItemOrderEntity.fromJson(Map<String, dynamic> json) {
    return ItemOrderEntity(
      id: json['id'] as int,
      quantity: json['quantity'] as int,
      item: ItemEntity.fromJson(json['item']),
    );
  }

  @override
  List<Object?> get props => [id, quantity, item];
}
