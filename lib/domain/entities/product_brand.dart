import 'package:equatable/equatable.dart';

class ProductBrandEntity extends Equatable {
  final int id;
  final String brandName;
  final String brandDescription;
  final String countryOfOrigin;
  final String foundedYear;

  ProductBrandEntity({
    required this.id,
    this.brandName = "",
    this.brandDescription = "",
    this.countryOfOrigin = "",
    required this.foundedYear,
  });

  factory ProductBrandEntity.fromJson(Map<String, dynamic> json) {
    return ProductBrandEntity(
      id: json['id'] as int,
      brandName: json['brandName'] as String,
      brandDescription: json['brandDescription'] as String,
      countryOfOrigin: json['countryOfOrigin'] as String,
      foundedYear: json['foundedYear'] as String,
    );
  }

  @override
  List<Object?> get props =>
      [id, brandName, brandDescription, countryOfOrigin, foundedYear];
}
