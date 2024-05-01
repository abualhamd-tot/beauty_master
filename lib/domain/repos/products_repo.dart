import 'package:beauty_master/core/typedefs.dart';
import 'package:beauty_master/domain/entities/product.dart';

abstract class ProductsRepo {
  FutureEitherFailureOr<List<ProductEntity>> getAll();
  FutureEitherFailureOr<ProductEntity> getById({required String id});
  FutureEitherFailureOr<List<ProductEntity>> searchByText(
      {required String text});
  FutureEitherFailureOr<List<ProductEntity>> searchByCategory(
      {required String text});
  FutureEitherFailureOr<List<ProductEntity>> SearchByBrand(
      {required String text});
}
