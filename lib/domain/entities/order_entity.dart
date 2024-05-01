import 'package:equatable/equatable.dart';

import '../enums/status.dart';
import 'item_order.dart';

class OrderEntity extends Equatable {
  final int id;
  final String from;
  final Status orderStatus;
  final String orderDate;
  final String orderArrivalDate;
  final List<ItemOrderEntity> itemOrders;

  OrderEntity({
    required this.id,
    this.from = "",
    required this.orderStatus,
    required this.orderDate,
    required this.orderArrivalDate,
    this.itemOrders = const [],
  });

  factory OrderEntity.fromJson(Map<String, dynamic> json) {
    return OrderEntity(
      id: json['id'] as int,
      from: json['from'] as String,
      orderStatus: json['orderStatus'] as Status,
      orderDate: json['orderDate'] as String,
      orderArrivalDate: json['orderArrivalDate'] as String,
      itemOrders: (json['itemOrders'] as List<dynamic>)
          .map((e) => ItemOrderEntity.fromJson(e))
          .toList(),
    );
  }

  @override
  List<Object?> get props =>
      [id, from, orderStatus, orderDate, orderArrivalDate, itemOrders];
}
