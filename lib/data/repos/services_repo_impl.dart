import 'package:beauty_master/core/typedefs.dart';
import 'package:beauty_master/data/datasources/services_datasouce.dart';
import 'package:beauty_master/domain/entities/service.dart';
import 'package:dartz/dartz.dart';

import '../../core/network/error/failure.dart';
import '../../domain/repos/services_repo.dart';

class ServicesRepoImpl implements ServicesRepo {
  final ServicesDatasource _serviceDatasource;

  ServicesRepoImpl({required ServicesDatasource serviceDatasource})
      : _serviceDatasource = serviceDatasource;
  @override
  FutureEitherFailureOr<List<ServiceEntity>> getAll() async {
    try {
      final result = await _serviceDatasource.getAll();
      return result.fold((failure) => Left(failure), (json) {
        if (json["isSuccess"] == true) {
          final List<ServiceEntity> products = [];
          for (final productJson in json['value']) {
            products.add(ServiceEntity.fromJson(productJson));
          }
          return Right(products);
        }

        return Left(ServerFailure(msg: "Something Went Wrong"));
      });
    } catch (e) {
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  FutureEitherFailureOr<ServiceEntity> getById({required String id}) async {
    try {
      final result = await _serviceDatasource.getById(id: id);
      return result.fold((failure) => Left(failure), (json) {
        if (json["isSuccess"] == true) {
          final service = ServiceEntity.fromJson(json['value']);
          return Right(service);
        }

        return Left(ServerFailure(msg: "Something Went Wrong"));
      });
    } catch (e) {
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  FutureEitherFailureOr<List<ServiceEntity>> searchByText(
      {required String text}) async {
    try {
      final result = await _serviceDatasource.searchByText(text: text);
      return result.fold((failure) => Left(failure), (json) {
        if (json["isSuccess"] == true) {
          final List<ServiceEntity> products = [];
          for (final productJson in json['value']) {
            products.add(ServiceEntity.fromJson(productJson));
          }
          return Right(products);
        }

        return Left(ServerFailure(msg: "Something Went Wrong"));
      });
    } catch (e) {
      return Left(ServerFailure(msg: e.toString()));
    }
  }
}
