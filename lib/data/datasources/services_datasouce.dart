import 'package:beauty_master/core/network/api/api_consumer.dart';
import 'package:beauty_master/core/network/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../../core/network/api/end_points.dart';
import '../core/typedefs.dart';

abstract class ServicesDatasource {
  FutureEitherFailureOrMap getAll();
  FutureEitherFailureOrMap getById({required String id});
  FutureEitherFailureOrMap searchByText({required String text});
}

class ServicesDatasourceImpl implements ServicesDatasource {
  final ApiConsumer _apiConsumer;

  ServicesDatasourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;
  @override
  FutureEitherFailureOrMap getAll() async {
    try {
      final result = await _apiConsumer.get(path: EndPoints.service);

      return result;
    } catch (e) {
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  FutureEitherFailureOrMap getById({required String id}) async {
    try {
      final result = await _apiConsumer.get(path: "${EndPoints.service}/$id");

      return result;
    } catch (e) {
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  FutureEitherFailureOrMap searchByText({required String text}) async {
    try {
      final result = await _apiConsumer.get(
          path: "${EndPoints.searchServicesByText}/$text");

      return result;
    } catch (e) {
      return Left(ServerFailure(msg: e.toString()));
    }
  }
}
