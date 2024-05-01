import 'package:equatable/equatable.dart';

class ProductCategoryEntity extends Equatable {
  final int id;
  final String categoryName;
  final int referenceNumber;

  ProductCategoryEntity({
    required this.id,
    this.categoryName = "",
    required this.referenceNumber,
  });

  factory ProductCategoryEntity.fromJson(Map<String, dynamic> json) {
    return ProductCategoryEntity(
      id: json['id'] as int,
      categoryName: json['categoryName'] as String,
      referenceNumber: json['referenceNumber'] as int,
    );
  }

  @override
  List<Object?> get props => [id, categoryName, referenceNumber];
}
