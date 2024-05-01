import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String msg;
  Failure({required this.msg});
  @override
  List<Object?> get props => [msg];
}

class ServerFailure extends Failure {
  ServerFailure({required super.msg});
}

class CacheFailure extends Failure {
  CacheFailure({required super.msg});
}
