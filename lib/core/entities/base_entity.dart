import 'package:equatable/equatable.dart';

class BaseEntity extends Equatable {
  final int id;

  BaseEntity({
    required this.id,
  });

  factory BaseEntity.fromJson(Map<String, dynamic> json) {
    return BaseEntity(
      id: json['id'],
    );
  }

  @override
  List<Object?> get props => [id];
}
