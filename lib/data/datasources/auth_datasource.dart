import 'package:beauty_master/core/inputs/login_input.dart';
import 'package:beauty_master/core/network/api/api_consumer.dart';
import 'package:beauty_master/core/network/error/failure.dart';
import 'package:beauty_master/core/typedefs.dart';
import 'package:dartz/dartz.dart';

abstract class AuthDataSource {
  FutureEitherFailureOr<Map<String, dynamic>> login(LoginInputs inputs);
}

class AuthDataSourceImpl implements AuthDataSource {
  final ApiConsumer _apiConsumer;

  AuthDataSourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;
  @override
  FutureEitherFailureOr<Map<String, dynamic>> login(LoginInputs inputs) async {
    try {
      // final response = await _apiConsumer.post(
      //   path: EndPoints.login,
      //   body: inputs.toJson(),
      // );
      // return response;
      return Right({"accessToken": "accessToken"});
    } catch (e) {
      return Left(ServerFailure(msg: e.toString()));
    }
  }
}
