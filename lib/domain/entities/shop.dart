import 'package:equatable/equatable.dart';

import 'product.dart';

class ShopEntity extends Equatable {
  final int id;
  final String shopPhoneNumber;
  final String createdDate;
  final List<ProductEntity> products;

  ShopEntity({
    required this.id,
    this.shopPhoneNumber = "",
    required this.createdDate,
    this.products = const [],
  });

  factory ShopEntity.fromJson(Map<String, dynamic> json) {
    return ShopEntity(
      id: json['id'] as int,
      shopPhoneNumber: json['shopPhoneNumber'] as String,
      createdDate: json['createdDate'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductEntity.fromJson(e))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [id, shopPhoneNumber, createdDate, products];
}