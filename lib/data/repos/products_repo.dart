import 'package:beauty_master/core/network/error/failure.dart';
import 'package:beauty_master/data/datasources/products_datasource.dart';
import 'package:dartz/dartz.dart';

import '../../core/typedefs.dart';
import '../../domain/entities/product.dart';
import '../../domain/repos/products_repo.dart';

class ProductsRepoImpl implements ProductsRepo {
  final ProductsDatasource _productsDatasource;

  ProductsRepoImpl({required ProductsDatasource productsDatasource})
      : _productsDatasource = productsDatasource;
  @override
  FutureEitherFailureOr<List<ProductEntity>> SearchByBrand(
      {required String text}) async {
    try {
      final result = await _productsDatasource.SearchByBrand(text: text);
      return result.fold((failure) => Left(failure), (json) {
        if (json["isSuccess"] == true) {
          final List<ProductEntity> products = [];
          for (final productJson in json['value']) {
            products.add(ProductEntity.fromJson(productJson));
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
  FutureEitherFailureOr<List<ProductEntity>> getAll() async {
    try {
      final result = await _productsDatasource.getAll();
      return result.fold((failure) => Left(failure), (json) {
        if (json["isSuccess"] == true) {
          final List<ProductEntity> products = [];
          for (final productJson in json['value']) {
            products.add(ProductEntity.fromJson(productJson));
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
  FutureEitherFailureOr<ProductEntity> getById({required String id}) async {
    try {
      final result = await _productsDatasource.getById(id: id);
      return result.fold((failure) => Left(failure), (json) {
        if (json["isSuccess"] == true) {
          final product = ProductEntity.fromJson(json['value']);
          return Right(product);
        }

        return Left(ServerFailure(msg: "Something Went Wrong"));
      });
    } catch (e) {
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  FutureEitherFailureOr<List<ProductEntity>> searchByCategory(
      {required String text}) async {
    try {
      final result = await _productsDatasource.searchByCategory(text: text);
      return result.fold((failure) => Left(failure), (json) {
        if (json["isSuccess"] == true) {
          final List<ProductEntity> products = [];
          for (final productJson in json['value']) {
            products.add(ProductEntity.fromJson(productJson));
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
  FutureEitherFailureOr<List<ProductEntity>> searchByText(
      {required String text}) async {
    try {
      final result = await _productsDatasource.searchByText(text: text);
      return result.fold((failure) => Left(failure), (json) {
        if (json["isSuccess"] == true) {
          final List<ProductEntity> products = [];
          for (final productJson in json['value']) {
            products.add(ProductEntity.fromJson(productJson));
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
