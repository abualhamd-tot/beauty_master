import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String productName;
  final String productDescription;
  final String productPrice;
  final String categoryName;
  final String productBrandName;
  final String? salesName;

  ProductEntity({
    required this.id,
    this.productName = "",
    this.productDescription = "",
    this.productPrice = "",
    this.categoryName = "",
    this.productBrandName = "",
    this.salesName,
  });

  factory ProductEntity.fromJson(Map<String, dynamic> json) {
    return ProductEntity(
      id: json['id'] as int,
      productName: json['productName'] as String,
      productDescription: json['productDescription'] as String,
      productPrice: json['productPrice'] as String,
      categoryName: json['categoryName'] as String,
      productBrandName: json['productBrandName'] as String,
      salesName: json['salesName'] as String?,
    );
  }

  @override
  List<Object?> get props => [
        id,
        productName,
        productDescription,
        productPrice,
        categoryName,
        productBrandName,
        salesName
      ];
}
