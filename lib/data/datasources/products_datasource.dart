import '../../core/network/api/api_consumer.dart';
import '../../core/network/api/end_points.dart';
import '../../core/typedefs.dart';

abstract class ProductsDatasource {
  FutureEitherFailureOr<Map<String, dynamic>> getAll();
  FutureEitherFailureOr<Map<String, dynamic>> getById({required String id});
  FutureEitherFailureOr<Map<String, dynamic>> searchByText(
      {required String text});
  FutureEitherFailureOr<Map<String, dynamic>> searchByCategory(
      {required String text});
  FutureEitherFailureOr<Map<String, dynamic>> SearchByBrand(
      {required String text});
}

class ProductsDatasourceImpl implements ProductsDatasource {
  final ApiConsumer _apiConsumer;

  ProductsDatasourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;

  @override
  FutureEitherFailureOr<Map<String, dynamic>> SearchByBrand(
      {required String text}) async {
    final response = await _apiConsumer.get(
        path: "${EndPoints.searchProductsByBrand}/$text");
    return response;
  }

  @override
  FutureEitherFailureOr<Map<String, dynamic>> getAll() async {
    final response = await _apiConsumer.get(path: EndPoints.product);
    return response;
  }

  @override
  FutureEitherFailureOr<Map<String, dynamic>> getById(
      {required String id}) async {
    final response = await _apiConsumer.get(path: "${EndPoints.product}/$id");
    return response;
  }

  @override
  FutureEitherFailureOr<Map<String, dynamic>> searchByCategory(
      {required String text}) async {
    final response = await _apiConsumer.get(
        path: "${EndPoints.searchProductsByCategory}/$text");
    return response;
  }

  @override
  FutureEitherFailureOr<Map<String, dynamic>> searchByText(
      {required String text}) async {
    final response =
        await _apiConsumer.get(path: "${EndPoints.searchProductsByText}/$text");
    return response;
  }
}
