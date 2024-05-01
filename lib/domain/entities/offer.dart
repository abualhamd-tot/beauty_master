import 'package:equatable/equatable.dart';

class OfferEntity extends Equatable {
  final int id;
  final String offerName;
  final String offerDescription;
  final String startDate;
  final String endDate;
  final int discount;
  final String productName;

  OfferEntity({
    required this.id,
    this.offerName = "",
    this.offerDescription = "",
    required this.startDate,
    required this.endDate,
    required this.discount,
    this.productName = "",
  });

  factory OfferEntity.fromJson(Map<String, dynamic> json) {
    return OfferEntity(
      id: json['id'] as int,
      offerName: json['offerName'] as String,
      offerDescription: json['offerDescription'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      discount: json['discount'] as int,
      productName: json['productName'] as String,
    );
  }

  @override
  List<Object?> get props => [
        id,
        offerName,
        offerDescription,
        startDate,
        endDate,
        discount,
        productName
      ];
}
