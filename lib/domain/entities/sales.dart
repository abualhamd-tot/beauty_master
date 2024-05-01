import 'package:equatable/equatable.dart';

import 'product.dart';

class SalesEntity extends Equatable {
  final String id;
  final String salesEmail;
  final String salesFirstName;
  final String salesLastName;
  final String salesPhoneNumber;
  final String userName;
  final List<ProductEntity> products;

  SalesEntity({
    this.id = "",
    this.salesEmail = "",
    this.salesFirstName = "",
    this.salesLastName = "",
    this.salesPhoneNumber = "",
    this.userName = "",
    this.products = const [],
  });

  factory SalesEntity.fromJson(Map<String, dynamic> json) {
    return SalesEntity(
      id: json['id'] as String,
      salesEmail: json['salesEmail'] as String,
      salesFirstName: json['salesFirstName'] as String,
      salesLastName: json['salesLastName'] as String,
      salesPhoneNumber: json['salesPhoneNumber'] as String,
      userName: json['userName'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductEntity.fromJson(e))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        salesEmail,
        salesFirstName,
        salesLastName,
        salesPhoneNumber,
        userName,
        products
      ];
}
