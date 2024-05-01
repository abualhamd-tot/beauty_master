import 'package:equatable/equatable.dart';

class FeedbackEntity extends Equatable {
  final int id;
  final String feedbackDate;
  final String feedbackDescription;
  final String feedbackCategory;
  final String customerName;

  FeedbackEntity({
    required this.id,
    required this.feedbackDate,
    this.feedbackDescription = "",
    this.feedbackCategory = "",
    required this.customerName,
  });

  factory FeedbackEntity.fromJson(Map<String, dynamic> json) {
    return FeedbackEntity(
      id: json['id'] as int,
      feedbackDate: json['feedbackDate'] as String,
      feedbackDescription: json['feedbackDescription'] as String,
      feedbackCategory: json['feedbackCategory'] as String,
      customerName: json['customerName'] as String,
    );
  }

  @override
  List<Object?> get props =>
      [id, feedbackDate, feedbackDescription, feedbackCategory, customerName];
}
