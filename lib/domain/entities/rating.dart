import 'package:equatable/equatable.dart';

class RatingEntity extends Equatable {
  final int id;
  final int ratingValue;
  final String ratingDate;

  RatingEntity({
    required this.id,
    required this.ratingValue,
    required this.ratingDate,
  });

  factory RatingEntity.fromJson(Map<String, dynamic> json) {
    return RatingEntity(
      id: json['id'] as int,
      ratingValue: json['ratingValue']as int,
      ratingDate: json['ratingDate'] as String,
    );
  }

  @override
  List<Object?> get props => [id, ratingValue, ratingDate];
}
